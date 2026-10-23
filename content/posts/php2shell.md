---
title: O php2shell não nasceu em 2026
date: 2026-10-23T11:57:43-03:00
draft: true
description: Dois RCEs críticos no PHP viraram caos na última terça-feira. A raíz estava em um bug de 2004, passou por um relatório em 2020 e um audit em 2024.
tags:
  - php
  - cybersecurity
  - llm
---
## Introdução
> TL;DR: Dois bugs de corrupção de memória no **PHP** (*CVE-2026-109618 e CVE-2026-109619*) permitem execução remota de código sem autenticação em praticamente qualquer servidor que sirva requisições web. A raíz já tinha sido avistada em 2004, registrada em 2020 e reencontrada num audit em 2024. Só em Agosto de 2026 alguém provou que dava para transformar aquilo em *shell*. O patch saiu em 21/10/2026, um dia antes do previsto, porque o embargo vazou. A unica correção real é atualizar.

No dia 20 de Outubro de 2026 o time de segurança do PHP soltou um aviso incomum, uma release de emergência sairia no dia seguinte, com duas vulnerabilidades críticas, ambas pontuadas em 9.2 no CVSS v4.0[^1]. Em poucas horas a internet estava de cabelo em pé. Pesquisadores já falavam em RCE afetando PHP 5, 6, 7 e 8, o apelido `php2shell` colou, e a **Cloudflare** começou a empurrar regras de WAF de emergência para tentar segurar a onda[^2].

O problema é tão sério quanto parece, os dois bugs são [CVE-2026-109618](https://www.cve.org/CVERecord?id=CVE-2026-109618) e [CVE-2026-109619](https://www.cve.org/CVERecord?id=CVE-2026-109619), descobertos pela *Calif* junto da *OpenAI* e *Wiz*[^3]. Os dois saem da mesma raiz: o PHP pode deixar a memória em estado corrompido quando uma requisição termina de forma anormal, por exemplo quando estoura o `memory_limit` no meio de uma operação nativa que não chegou a limpar o que alocou[^4].

A mecânica, de forma resumida:
- **CVE-2026-109618** encadeia um estouro controlado de `memory_limit` (um *"OOM-fatal"* disparável sob demanda) com pontos de interrupção no interpretador que deixam estruturas de `HasTable` parcialmente inicializadas. O *teardown* da requisição depois confia numa contagem que já foi incrementada, mas em buckets que nunca foram preenchidos, e consome `bytes` alocados como se fossem um bucket válido. Isso leva a RCE como a conta do **worker** web[^4];
- **CVE-2026-19619** é um *use-after-free* de estado global. O recurso de `session.upload_progress` abre e atualiza uma sessão enquanto o PHP ainda está parseando o corpo da requisição, antes do código da aplicação rodar. Se um `fatal` interrompe esse processo, os ponteiros da sessão ficam apontando para um `heap` já liberado, e uma segunda requisição consegue assumir esse estado obsoleto[^4];

Por que é tão grave? Porque nos dois casos o ataque dispara **antes de qualquer código da aplicação rodar**. Login, controle de permissão, validação de input: nada disso entra em cena a tempo. A requisição maliciosa chega no parsing de `multipart/form-data`, na inicialização da requisição, e já é tarde[^2].

> O próprio time do PHP disse que considera o risco mais alto no `mod_php`, onde um request não autenticado dispara o ataque antes de qualquer código da aplicação rodar[^4].

A **medida recomendada agora é uma só: atualizar**. as versões corrigidas são **PHP 8.5.12**, **8.4.27**, **8.3.36** e **8.2.35**[^4]. Quem está em **PHP 7 ou anterior** precisa migrar para uma versão suportada; o **PHP 8.1** e anteriores não recebem mais suporte oficial, embora o time tenha liberado backports mínimos de código-fonte para **7.4**, **8.0** e **8.1** para quem compila do zero ou não tem um fornecedor LTS[^4].

Existem migrações temporárias (`memory_limit=-1`, `session.upload_progress.enabled=0`, `post_max_size` baixo), mas a própria core developer **Gina Peter Banyard** foi direta: nenhuma delas bloqueia o ataque por completo, e aplicar o patch é a única defesa permanente[^2] [^4]. Setar `memory_limit=-1`, aliás, remove o teto de memória do PHP e aumenta o risco de exaustão, então é remédio com efeito colateral.

## De onde isso veio: 2004, 2020, 2024
Aqui a história fica interessante, porque nenhuma dessas falhas nasceu em 2026.

### 2004: o avô do bug
Lá em **2004**, **Stefan Esser**, à época *o cara* de segurança do PHP, encontrou a primeira vulnerabilidade remota de `memory_limit` no PHP 5. Ele considerou **crítica o suficiente para não publicar** o exploit. Dois fornecedores comerciais (*CORE e Immunity*) desenvolveram exploits privados na mesma linha, e o resto da internet ficou com exploits falsos circulando no IRC, feitos para comprometer quem tentasse usá-los[^5].

O ponto central já estava ali: forçar o PHP a estourar uma memória num momento escolhido deixa o interpretador num estado ruim. A ideia de 2026 é, no fundo, uma releitura desse mesmo primitivo, 22 anos depois.

### 2020: o relatório que ninguém levou a sério
Em **2019/2020**, um bug foi reportado ao projeto: o [#78876](https://bugs.php.net/bug.php?id=78876), *"Long variables in multipart/form-data cause OOM and temp files are not cleaned"*[^6]. A descrição dizia que variáveis longas num upload `multipart/form-data` podiam causar uma condição de `out-of-memory` e deixar arquivos temporários sem limpeza, enchendo o disco[^6].

Na época, o tratamento foi óbvio para o que parecia ser: um problema de robustez. O patch de Março de 2020 corrigiu o tipo usado no cálculo de tamanho (trocou `int` por `size_t` em `multipart_buffer_read`), fechando o **integer overflow**, e o bug entrou nas releases **7.2.31**, **7.3.18** e **7.4.6** de Maio de 2020[^7]. Foi tratado como DoS/esgotamento de recurso, não como caminho para execução de código. E, para o que se sabia então, estava correto: ninguém tinha provado que dava para ir além.

### 2024: o audit que viu a fumaça, mas não o fogo
Em **2024**, o PHP passou pelo seu primeiro audit externo de segurança, financiado pela **Sovereign Tech Agency**, coordenado pela **OSTIF** e executado pela **Quarkslab**, antes da release do **PHP 8.48**[^8]. O audit durou cerca de dois meses, gerou **2 issues de alta severidade**, **6 de média**, **9 de baixa** e **10 informativas**, com **quatro CVEs** atribuídos[^9]. Vários dos achados ficaram justamente na área de *parsing* de formulários **RFC 1867**, exatamente o terreno do **#78876**[^9].

O que importa aqui é o relato que o próprio PHP Foundation deu depois: durante o audit de 2024, um core developer contratado reencontrou os sinais iniciais do problema de corrupção de memória enquanto corrigia outra coisa[^10]. Alguém teorizou um exploit possível na época. Mas ninguém achou um caminho concreto de exploração, e problemas mais claros tinha prioridade[^11]. Então o bug **não foi corrigido**, porque a exploração não estava provada.

E aí veio a parte que o Foundation admitiu com honestidade rara. O conserto travou. O time de segurança rascunhou várias correções concorrentes, cada uma com um custo; uma delas quebrava compatibilidade retroativa. Nas palavras do próprio Foundation, o atraso foi uma falha estrutural, causada tanto pelo processo de decisão do time de segurança quanto pela falta de recursos[^11]. Traduzindo: eles sabiam que tinha algo ali, não conseguiram decidir como consertar sem machucar o ecossistema, e deixaram o problema envelhecer.

## Conclusão: por que o caso só veio em 2026
O gatilho foi a iniciativa **Patch the Planet**, da *OpenAI*, que convidou a *Calif* para auditar alvos de alto impacto, e o PHP era um deles[^3][^12]. Com a ponte feita via *Stefan Esser* e o *PHP Foundation* (através de *Volker Dusch*), o pesquisador *Ryan Austin* foi atrás justamente da história antiga do alvo[^12].

É aqui que mora a lição técnica mais interessante. *Austin* foi explícito: não usou nenhum *harness* especial nem modelo fora do que todo mundo tinha acesso, ele focou em algo que já conhecia bem, **a história de vulnerabilidades do PHP**, e partiu da teoria de que bugs específicos estavam escondidos no código. A observação dele é que as LLMs, por padrão, tendem a partir dos bugs mais novos e famosos em direção ao código vizinho; elas não começam espontaneamente por um primitivo de exploração obscuro de vinte anos atrás. Manter o seu próprio catálogo mental da história do alvo é o que permite apontar a IA nessa direção[^4]. *"Conheça o seu alvo"* continua valendo, mesmo na era das LLMs.

A cronologia de 2026, do ponto de vista da Calif[^4]:

| Data       | Evento                                                                |
| ---------- | --------------------------------------------------------------------- |
| 2004       | *Stefan Esser* acha o primeiro RCE de `memory_limit`                  |
| 2020       | Bug **#78876** reportado e tratado com DoS                            |
| 2024       | Audit *OSTIF/Quarkslab* reencontra o problema; exploração não provada |
| 01/08/2026 | *Calif* acha múltiplos caminhos independentes até RCE                 |
| 11/08/2026 | *Calif* reporta o primeiro bug ao PHP; vira prioridade máxima         |
| 14/08/2026 | *Calif* compartilha PoC de RCE com PHP                                |
| 15/08/2026 | PHP confirma que o PoC funciona                                       |
| 21/08/2026 | *Calif* reporta o segundo bug                                         |
| 21/10/2026 | Releases corrigidas publicadas                                        |
Ou seja: o que mudou entre **2004** e **2026** não foi a existência da falha. Foi alguém, armado com a história do alvo e uma LLM como parceira de auditoria, finalmente provar que o primitivo antigo virava shell. O caos de 20 de Outubro não veio porque a falha nasceu ali; veio porque o embargo vazou. Detalhes (os dois CVE IDs e orientações de mitigação dadas a provedores de infraestrutura crítica) caíram online antes da hora, o que forçou o PHP a antecipar a release de 22 para 21 de Outubro[^13].

Pior: a Amazon depois reportou que as primeiras tentativas de exploração começaram em 17 de Outubro, quatro dias antes do patch, vindas de IPs de redes de anonimização[^14]. A bomba já tinha sido armada em 2004; em 2026 alguém só encontrou o detonador, e outra pessoa o acionou cedo demais.

### Devemos abandonar o PHP?
Essa é uma pergunta que sempre surge quando um episódio desses acontece. Minha resposta é dividida, e eu vou ser honesto sobre a divisão.

**Do meu ponto de vista pessoal: sim**. Eu não escolheria o PHP para um projeto novo hoje. Não por causa deste bug em específico, que, convenhamos, é o tipo de corrupção de memória nativa que pode morar em qualquer interpretador escrito em C, inclusive nos que eu prefiro. **É pela soma**: uma linguagem cujo histórico de design acumulou armadilhas de memória desde 2004, mantida por um time pequeno e cronicamente sem recursos, carregando compatibilidade retroativa que trava correções, não é onde eu quero estar quando a próxima bomba de 22 anos for desarmada. É minha preferência, e eu assumo isso.

Do ponto de vista técnico e comercial: não. E aqui a minha opinião pessoal não entra. O PHP roda entre 75% e 80% dos sites na internet[^2]. WordPress, Drupal, Joomla, Magento, Laravel, Symfony: o ecossistema é gigante, maduro e empregável. O próprio Foundation, no meio do caos, foi transparente sobre a causa raiz, liberou backports para versões fora de suporte e já estava usando IA (via parceira com a Alpha-Omega, rodando o Claude Mythos) para varrer o próprio código[^10]. Isso não é um projeto podre; é um projeto subfinanciado fazendo o que dá com o que tem. Abandonar o PHP por causa de uma RCE seria jogar fora décadas de ecossistema funcional por um bug que a disciplina de segurança básica (patch rápido) resolve.

A moral que eu tiro daqui não é sobre o PHP. É sobre a dívida de segurança. Um sinal avistado em 2004, registrado em 2020, reencontrado em 2024 e só corrigido em 2026, sob fogo, é o retrato de como *"exploração não provada"* vira *"exploração provada"* no pior momento possível. O código não melhora sozinho enquanto a gente espera. E, como a própria história do php2shell mostra, com uma LLM apontada na direção certa, a janela entre *"ninguém sabe explorar"* e *"tem exploit circulando no fórum"* ficou muito, muito mais curta.

## Bibliografia
[^1]: THE PHP GROUP. *Advance notice: upcoming security release (2026-10-20)*. php.net, 20 out. 2026. [https://www.php.net/archive/2026.php#2026-10-20-1](https://www.php.net/archive/2026.php#2026-10-20-1)
[^2]: GATLAN, Sergiu. _PHP ships emergency patches for critical PHP2Shell flaws_. BleepingComputer, 21 out. 2026. [https://www.bleepingcomputer.com/news/security/php-ships-emergency-patches-for-critical-php2shell-flaws/](https://www.bleepingcomputer.com/nes/security/php-ships-emergency-patches-for-critical-php2shell-flaws/)
[^3]: OPENAI. _Coordinated disclosure of critical PHP vulnerabilities_. 21 out. 2026. [https://openai.com/index/coordinated-disclosure-of-critical-vulnerabilities/](https://openai.com/index/coordinated-disclosure-of-critical-vulnerabilities/)
[^4]: AUSTIN, Ryan (Calif Research). _php2shell: A tale of two PHP remote vulnerabilities_. Calif, out. 2026. [https://calif.io/php2shell/](https://calif.io/php2shell/)
[^5]: ESSER, Stefan. _First PHP memory limit remote vulnerability_ (Bugtraq, 2004). [https://marc.info/?l=bugtraq&m=108981780109154&w=2](https://marc.info/?l=bugtraq&m=108981780109154&w=2)
[^6]: THE PHP GROUP. _Sec Bug #78876: Long variables in multipart/form-data cause OOM and temp files are not cleaned_. bugs.php.net, 2019–2020. [https://bugs.php.net/bug.php?id=78876](https://bugs.php.net/bug.php?id=78876)
[^7]: BECKER, Christoph M. _Fix #78876 (commit 3c8582ca)_; ChangeLog PHP 7.2.31 / 7.3.18 / 7.4.6 (CVE-2019-11048). php.net, mar./maio 2020. [https://www.php.net/ChangeLog-7.php#7.4.6](https://www.php.net/ChangeLog-7.php#7.4.6)
[^8]: OSTIF. _PHP Audit Complete!_. 10 abr. 2025 (audit conduzido em 2024). [https://ostif.org/php-audit-complete/](https://ostif.org/php-audit-complete/)
[^9]: QUARKSLAB. _Security audit of PHP-SRC_. 10 abr. 2025. [https://blog.quarkslab.com/security-audit-of-php-src.html](https://blog.quarkslab.com/security-audit-of-php-src.html)
[^10]: THE PHP FOUNDATION. _Today's PHP security release, and how we're strengthening PHP security_. 21 out. 2026. [https://thephp.foundation/blog/2026/10/21/todays-php-security-release-and-how-were-strengthening-php-security/](https://thephp.foundation/blog/2026/10/21/todays-php-security-release-and-how-were-strengthening-php-security/)
[^11]: NIEBORG, Tristan (relato). _PHP knew about one of the flaws in 2024 but could not agree a fix_. The Next Web, out. 2026. [https://thenextweb.com/news/php-foundation-structural-failure-2024-flaw-leak](https://thenextweb.com/news/php-foundation-structural-failure-2024-flaw-leak)
[^12]: OPENAI. _Patch the Planet_. [https://openai.com/index/patch-the-planet/](https://openai.com/index/patch-the-planet/)

[^13]: GOODING, Sarah. _PHP Foundation says Chainguard broke security embargo ahead of emergency patches_. Socket, 21 out. 2026. [https://socket.dev/blog/php-embargo-dispute](https://socket.dev/blog/php-embargo-dispute)

[^14]: GATLAN, Sergiu. _Amazon says PHP2Shell exploitation began 4 days before patches_. BleepingComputer, 22 out. 2026. [https://www.bleepingcomputer.com/news/security/amazon-says-php2shell-exploitation-began-4-days-before-patches/](https://www.bleepingcomputer.com/news/security/amazon-says-php2shell-exploitation-began-4-days-before-patches/)
