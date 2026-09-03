---
title: Vibe Coding e seus impactos
date: 2026-04-20
draft: false
description: Análise crítica do desenvolvimento assistido por IA e seus impactos no mercado, segurança e competência técnica
tags:
  - engenharia-de-software
  - llm
  - vibe-coding
---
## Introdução

> TL;DR: O avanço das LLMs trouxe a democratização do desenvolvimento, mas o custo pode ser muito alto nos próximos anos.

Esse post nada mais é do que um paper que eu estava elaborando. O objetivo principal era publicar em alguma revista/magazine, como a IEEE. Mas, por falta de tempo para concluir e passar a limpo, optei por publicar o rascunho inicial aqui até que a ideia central esteja lapidada e definida.

## Resumo

O fenômeno denominado **Vibe Coding** _— caracterizado pelo uso de ferramentas de geração de código baseadas em inteligência artificial sem compreensão técnica profunda por parte do usuário —_ emerge como uma prática disruptiva no ecossistema de desenvolvimento de software contemporâneo. Este artigo realiza uma análise conceitual e comparativa do fenômeno, examinando seus efeitos sobre dois perfis distintos de usuários: iniciantes sem formação técnica e profissionais experientes com sólida consciência de segurança. São investigadas as implicações para a qualidade do código, manutenibilidade, segurança de sistemas, padrões de contratação e a potencial erosão de competências técnicas no longo prazo. A análise adota postura neutra e pluralista, reconhecendo tanto os ganhos de produtividade e democratização do desenvolvimento quanto os riscos sistêmicos observados. Os resultados indicam que o impacto do Vibe Coding é profundamente dependendo do contexto de uso e do nível de supervisão técnica aplicado, demandando da indśutria e da academia respostas regulatórias, educacionais e metodológicas adequadas.

Palavras-chave: Vibe Coding, geração de código por IA, LLM, segurança de software.

## 1. Introdução

A aceleração no desenvolvimento e adoção de modelos de linguagem de grande escala (_Large Language Models — LLMs_) como GPT-4 [OpenAI, 2023], Claude [Anthropic, 2024] e Gemini [Google DeepMind, 2024] introduziu um novo paradigma na produção de software. Ferramentas como GitHub Copilot [GitHub, 2021], Cursor, Replit AI e similares tornaram possível a geração automatizada de trechos de código a partir de descrições em linguagem natural, reduzindo significativamente a barreira de entrada para a criação de aplicações funcionais.

Nesse contexto, o termo _Vibe Coding_ _— cunhado informalmente e popularizado em comunidades técnicas online a partir de 2023 —_ descreve a prática de delegar a escrita de código quase integralmente a sistemas de IA, com o operador humano atuando primariamente como especificador de intenções e validador superficial de resultados, sem necessariamente compreender a implementação subjacente. O termo carrega uma conotação de fluidez e imersão criativa, em contraste com o desenvolvimento tradicional orientado à compreensão e controle técnicos [Andrej Karpathy, 2023] _— referência a declaração pública_.

Este fenômeno suscita questões fundamentais para a engenharia de software enquanto disciplina: Qual é o impacto sobre a qualidade e segurança do software produzido? Quais são as consequências para a formação e valorização de profissionais técnicos? De que maneira o mercado de trabalho e os padrões de contratação serão afetados? E em que medida a democratização do desenvolvimento representa um avanço genuíno ou uma transferência de complexidade e risco para camadas menos visíveis do sistema?

Este artigo busca responder a essas questões de forma analítica, estruturada e desprovida de viés normativo excessivo.

## 2. Contexto e trabalhos relacionados

## 2.1 Geração de código por LLMs

A capacidade dos LLMs de produzir código funcional em múltiplas linguagens de programação foi demonstrada de forma consistente em benchmarks como HumanEval [Chen et al., 2021] e MBPP [Austin et al., 2021]. Estudos indicam que modelos como GPT-4 alcançam taxas de resolução superiores a 85% em problemas de programação competitiva de nível introdutório [OpenAI, 2023], embora o desempenho decreça substancialmente em problemas de alta complexidade ou que exijam raciocínio multi-etapa não trivial.

Ferramentas de assistência ao desenvolvimento, como GitHub Copilot, relataram ganhos de produtividade de aproximadamente 55% em tarefas de codificação específicas em estudos controlados [GitHub/Microsoft, 2022], embora críticos apontem vieses metodológicos nessa mensuração [Ziegler et al., 2022].

## 2.2 Precedentes históricos

O debate sobre automação e abstração no desenvolvimento de software não é novo. A transição de linguagem de máquina para linguagens de alto nível, o advento de frameworks, geradores de código _— como scaffolding em Rails ou Angular CLI —_ e ambientes low-code/no-code precedem o _Vibe Coding_ como fenômenos de abstração progressiva. Cada transição gerou tensões similares entre ganhos de acessibilidade e riscos de opacidade técnica [Sommerville, 2016].

O que distingue o atual momento é a amplitude e generalidade dos LLMs, diferentemente de ferramentas anteriores, que operavam em domínios restritos, os assistentes de codificação baseados em IA podem gerar soluções em qualquer stack tecnológico, para qualquer nível de complexidade aparente, com base apenas em descrição em linguagem natural.

## Trabalhos relevantes

Pesquisas recentes sobre qualidade de código gerado por IA identificam padrões de vulnerabilidades recorrentes. Pearce et al. [2022]analisaram código gerado pelo GitHub Copilot e identificam que aproximadamente 40% das sugestões em contextos de segurança continham pelo menos uma vulnerabilidade explorável. Khoury et al. [2023] replicaram análises similares com foco em CWE (_Common Weakness Enumeration_) e confirmaram a presença sistemática de falhas como injeção de SQL, uso inseguro de funções de criptografia e ausência de validação de entrada.

No campo da cognição e aprendizado, estudos sobre o impacto de ferramentas de autocompletar código na retenção de conhecimento sugerem correlações negativas entre dependência excessiva de sugestões automatizadas e profundidade de compreensão conceitual em estudantes [Denny et al., 2023].

## 3. Metodologia

Este trabalho adota uma abordagem analítica-conceitual, fundamentada na revisão de literatura técnica, relatos de práticas da indústria e análise de tendências de mercado. Não foram conduzidos experimentos empíricos originais. A estrutura comparativa entre perfis de usuários _— iniciantes vs. profissionais —_ serve como eixo organizador da análise, permitindo a avaliação diferencial de benefícios e riscos conforme o contexto de uso.

As fontes consultadas incluem artigos revisados por pares em conferências como ICSE, CCS e IEEE S&P; relatórios de mercado de organizações como Gartner, Stack Overflow e GitHub; e declarações públicas de desenvolvedores e pesquisadores relevantes. Onde dados exatos não puderam ser verificados, as afirmações são apresentadas como tendências observadas ou estimativas qualificadas.

## 4. Análise comparativa: Iniciantes vs. Profissionais

## 4.1 Perfil 1 — Iniciantes sem formação técnica

### 4.1.1 Benefícios

**Democratização do desenvolvimento.** O _Vibe Coding_ reduz drasticamente a barreira de entrada para a criação de software funcional. Indivíduos sem formação em ciências da computação podem prototipar aplicações web, scripts de automação e ferramentas internas com velocidade sem procedente. Isso tem valor genuíno em contextos de empreendedorismo, pesquisa aplicada e automação de processos em domínios não-técnicos.

**Velocidade de prototipagem.** A capacidade de transformar uma ideia em um protótipo funcional em horas, em vez de semanas, representa um avanço significativo para validação de hipóteses de negócio. Plataformas como Replit e Lovable democratizam esse ciclo [Replit, 2023].

**Redução de custo de entrada.** Para pequenas empresas e projetos individuais com orçamento limitado, a IA como copiloto de desenvolvimento reduz a dependência de contratação de desenvolvedores para tarefas de baixa complexidade.

### 4.1.2 Riscos

**Ilusão de competencia (illusion of competence).** O principal risco para iniciantes é a ausência de mecanismos internos de validação. Sem compreensão do código gerado, o usuário é incapaz de identificar falhas lógicas, vulnerabilidades de segurança ou implementações subótimas. O código funciona _— até que não funcione, e o operador não possui as ferramentas conceituais para diagnosticar a falha_.

**Divida técnica acumulada silenciosamente.** Código gerado por IA sem revisão técnica tende a acumular dívida técnica de forma acelerada, ausência de testes, acoplamento excessivo, nomenclatura inconsistente, lógica duplicada e ausência de tratamento de erros são padrões recorrentes [Nascimento et al., 2023]. Para iniciantes, essa dívida raramente é visível até que o sistema atinja escala ou falhe em produção.

**Vulnerabilidades de segurança não percebibas.** Sem consistência de segurança, iniciantes que implantam código gerado por IA em ambientes de produção frequentemente o fazem sem aplicar qualquer processo de revisão de segurança. Problemas como exposição de credenciais em repositórios, ausência de autenticação adequada, injeção de SQL e ausência de sanitização de entrada são observados com frequência em projetos _vibe-coded_ disponíveis publicamente [Pearce et al., 2022]

**Dependência estrutural.** A ausência de aprendizado técnico durante o processo de construção cria uma dependência funcional da ferramenta de IA. Quando a ferramenta muda, descontinua ou produz resultados inconsistentes, o usuário carece de competências necessárias para adaptar ou corrigir o sistema.

## 4.2 Perfil 2 — Profissionais experientes

### 4.2.1 Benefícios

**Aceleração de tarefas repetitivas.** Para engenheiros sênior, a IA representa uma automação eficaz de tarefas de baixo valor cognitivo, geração de boilerplate, escrita de testes unitários, documentação de funções, refatoração de padrões conhecidos e conversão entre formatos. Isso libera capacidade cognitiva para problemas de maior complexidade [Ziegler et al., 2022]

**Exploração de domínios não familiares.** Profissionais com experiência sólida em uma stack podem usar assistentes de IA para explorar rapidamente tecnologias adjacentes _— um engenheiro backend pode prototipar interfaces frontend funcionais, ou um especialista em Python pode gerar scripts em Rust —_ com a capacidade de revisar criticamente o output produzido.

**Aumento de throughput em equipes.** Em contextos de engenharia de produto, a IA como ferramenta de amplificação pode aumentar a capacidade efetiva de entrega de uma equipe sem aumento proporcional de headcount, impactando positivamente métricas de developer experience e velocidade de entrega [GitHub/Microsoft, 2022].

### 4.2.2 Riscos

**Erosão gradual de competências de baixo nível.** A automação contínua de tarefas antes executadas manualmente _— incluindo escrita de queires SQL, implementação de algoritmos básicos, configuração de infraestrutura —_ pode, ao longo do tempo, degradar a fluência técnica nessas áreas. O risco não é imediato, mas é plausível como tendência de longo prazo, especialmente para profissionais em estágios iniciais de carrera que adotam IA intensivamente [Denny et al., 2023].

**Confiança excessiva no output gerado (automation bias).** Profissionais experientes não estão imunes ao viés da automação, a tendência de aceitar sugestões de sistemas automatizados sem revisão crítica suficiente, especialmente sob pressão de tempo, pode introduzir bugs sutis ou vulnerabilidades que passariam pela revisão de um desenvolvedor atento [Parasuraman & Manzey, 2010].

**Complexidade de auditoria e rastreabilidade.** Em ambientes regulados _— fintechs, saúde, defesa —_, a introdução de código gerado por IA sem rastreabilidade adequada sobre sua origem, treinamento e possível vieses introduz riscos de conformidade e auditoria que ainda carecem de frameworks regulatórios consolidados [EU AI Act, 2024].

**Homogenização de soluções.** LLMs tendem a convergir para soluções padrão presentes em seus dados de treinamento. Isso pode suprimir soluções inovadoras e criar homogenidade técnica sem sistemas que se beneficiaram de diversidade arquitetural [Bender et al., 2021]

## 5. Implicações de segurança

## 5.1 Vulnerabilidades sistemáticas em código gerado por IA

A análise de vulnerabilidades em código gerado por LLMs revela padrões consistentes. Pearce et al. [2022] identificaram que o GitHub Copilot, quando solicitado a completar cenários com implicações de segurança, produzia código vulnerável em proporções significativas dos casos, incluindo:

- **Injeção de SQL** por ausência de parametrização de queries;
- **Uso inadequado de APIs criptográgicas** _— e.g., uso de MD5 para hashing de senhas, IVs estáticos em cifragem simétrica_;
- **Deserialização insegura** em contextos de processamento de dados externos;
- **Exposição de informações sensíveis** em mensagens de erro ou logs;
- **Ausência de validação e sanitização de entrada** em interfaces de usuários e APIs;

Esses padrões não são exclusivos de um modelo específico, mas refletem a natureza dos dados de treinamento, código disponível publicamente em repositórios como GiHub contém proporções significativas de código inseguro, e os modelos aprendem esses padrões sem discriminação de qualidade de segurança [Khoury et al., 2023].

## 5.2 O problema da superfície de ataque expandida

O _Vibe Coding_ em larga escala implica uma expansão da superfície de ataque global, mais software é produzido, mais rapidamente, por operadores com menor capacidade de revisão técnica. Se uma proporção significativa desse software é implantada em produção sem revisão de segurança adequada, o resultado agregado é um aumento no número de sistemas vulneráveis expostos.

Isso é especialmente relevante em contextos de SaaS de nicho, ferramentas internas corporativas e automações departamentais _— categorias de software que historicamente operam fora do escopo de processos formais de segurança_.

## 5.3 Ausência de cultura de _Secure by Design_

O paradigma do _Vibe Coding_ é fundamentalmente orientado a resultados funcionais imediatos. A consideração de segurança como requisito não-funcional primário é frequentemente ausento tanto nas instruções fornecidas ao modelo quanto na validação do output. Sem a incorporação explícita de práticas como threat modeling, análise estática de código _— SAST —_ e revisão de segurança no fluxo de _Vibe Coding_, o resultado tende à omissão sistemática de controles de segurança básicos.

## 6. Impacto no mercado atual

## 6.1 Redefinição de papéis e funções

O mercado de desenvolvimento de software já demonstra sinais de pressão sobre papéis de entrada. Relatórios de contratação de 2023 a 2024 já indicam redução relativa na demanda por desenvolvedores júnior em empresas que adotam ferramentas de IA de forma extensiva [Stack Overflow Developer Survey, 2024]. A hipótese subjacente _— de que LLMs substituem parcialmente o trabalho de baixa a média complexidade típico de posições júnior —_ tem suporte circunstancial, embora causalidade direta seja difícil de isolar de outros fatores macroeconômicos.

## 6.2 Compreensão do ciclo de prototipagem

Startups e equipes de produto reportam reduções substanciais no tempo de lançamento de MVPs (_Minimum Viable Products_). Isso altera dinâmicas competitivas, a velocidade de validação de hipóteses de produto aumenta, e a vantagem competitiva de _time-to-market_ se redistribui de equipes ocm maior headcount técnico para equipes com maior capacidade de uso eficaz de ferramentas de IA.

## 6.3. Surgimento de novos perfis profissionais

Emerge um novo perfil _— o AI Engineer ou Prompt Engineer —_ cuja competência central não é a escrita do código, mas a capacidade de especificar, avaliar e orquestrar outputs de sistemas de IA. Esse perfil ainda não possui definição consolidade no mercado, e sua valorização relativa a engenheiros de software tradicionais é obejto de debate ativo [Shanahan et al., 2023].

## 6.4 Pressão sobre padrões de contratação

Organizações revisam critérios de avaliação técnica em processos seletivos. Entrevistas de codificação ao vivo _— whiteboard coding —_ perdem relevância diagnóstica quando candidatos podem ter tido sua experiência medida por IA. Isso pressiona a indústria a desenvolver novos instrumentos de avaliação que distingam compreensão técnica genuína de proficiência em uso de ferramentas assistidas.

## 7. Perspectivas futuras

## 7.1 Trajetória tecnológica

A capacidade técnica dos assistentes de IA para geração de código continuará a aumentar. Modelos futuros provavelmente demonstrarão maior consistência na geração de código seguro, melhor compreensão de contexto arquitetural e maior capacidade de manutenção de coerência em bases de código grandes. Isso reduzirá alguns dos riscos associados à qualidade técnica do output, mas não eliminará os riscos derivados da ausência de supervisão humana qualificada.

## 7.2 Risco de erosão sistêmica de competências

Se gerações sucessivas de desenvolvedores formarem suas competências primariamente através do _Vibe Coding_, sem exposição ao desenvolvimento tradicional, o mercado poderá enfrentar uma escassez progressiva de profissionais capazes de diagnosticar, auditar e corrigir sistemas complexos sem assistência de IA. Esse risco é análogo ao debate sobre calculadoras no ensino de matemática, mas com implicações sistêmicas potencialmente mais severas dado o papel crítico do software em infraestruturas.

## 7.3 Resposta regulatória e institucional

O EU AI Act [2024] e iniciativas similares em outras jurisdições começam a endereçar responsabilidade por sistemas de IA em contextos de alto risco. É plausível que categorias de software produzidas via _Vibe Coding_ sem revisão técnica adequada venham a ser objeto de requisitos regulatórios específicos, especialmente em setores críticos. Instituições de ensino superior e organizações como IEEE e ACM deverão, previsivelmente, revisar currículos e padrões éticos para incorporar competências de supervisão de IA.

## 7.4 Convergência de paradigmas

É provável que o futuro do desenvolvimento de software não seja uma dicotomia entre _Vibe Coding_ e desenvolvimento tradicional, mas um espectro de práticas nas quais a IA opera como amplificador de competência técnica humana. O valor diferencial do engenheiro humano migrará progressivamente para capacidades de ordem superior, arquitetura de sistemas, raciocínio sobre trade-offs, supervisão de qualidade e segurança, e compreensão de contexto de negócio.

## 8. Conclusão

A análise apresentada sugere que os impactos do _Vibe Coding_ são fundamentalmente dependentes do contexto e do perfil do operador. Para iniciantes, a prática oferece ganhos reais de acessibilidade e produtividade, mas a ausência de competência técnica para supervisão cria riscos sistêmicos não triviais, especialmente em dimensões de segurança e manutenibilidade. Para profissionais, os benefícios de amplificação são substanciais e bem documentados, mas riscos sutis de erosão de competência e viés de automação demandam atenção ativa.

O debata sobre _Vibe Coding_ frequentemente colapsa em posições normativas _— entusiasmo crítico ou rejeição defensiva —_ que obscurecem a análise das condições sob as quais a prática é benéfica ou prejudicial. Uma abordagem mais produtiva reconhece que a questão central não é se IA deve ser usada para geração de código, mas _como_ estruturar as práticas, processos e competências necessários para que seu uso produza software de qualidade adequada.

Nesse sentido, a responsabilidade é distribuída entre múltiplos atores, desenvolvedores de ferramentas de IA _— incorporando guardrails de segurança e sinalizações de risco —_; organizações que adotam essas ferramentas _— estabelecendo processos de revisão e padrões de qualidade —_; educadores _— revisando currículos para equilibrar fundamentos técnicos e competências de uso de IA —_; e a comunidade de pesquisa _— produzindo evidências empíricas rigorosas sobre impactos de longo prazo —_.

## 9. Conclusão

O _Vibe Coding_ representa uma inflexão genuína no paradigma de desenvolvimento de software, com implicações que extrapolam ganhos imediatos de produtividade. A democratização do desenvolvimento é um benefício real e não trivial. Os riscos _— em segurança, manutenbilidade, formação técnica e padrões de mercado —_ são igualmente reais e demandam resposta ativa da indústria e da academia.

A pesquisa empírica rigorosa sobre os impactos de longo prazo do _Vibe Coding_ ainda é incipiente. Estudos longitudinais sobre erosão de competências, análises sistemáticas de segurança em código produzido via IA em ambientes de produção reais, e avaliações de impacto nos padrões de contratação são necessidades urgentes para fundamentar políticas e práticas informadas por evidência.

O desenvolvimento de software como disciplina enfrenta, no _Vibe Coding_, tanto uma oportunidade de expansão quanto um desafio de manutenção de padrões de qualidade e segurança que protegem os sistemas sobre os quais a sociedade contemporânea opera. Navegar essa tensão com rigor analítico é a tarefa centra que se apresenta à comunidade técnica.

## Referências

- Andrej Karpathy. Declaração pública sobre Vibe Coding. Twitter, fevereiro de 2023.
- Anthropic. Claude 3 Technical Report. 2024
- Austin, J. et al. "Program synthesis with large language models." arXiv preprint arXiv:2108.07732, 2021.
- Bender, E. M. et al. "On the dangers of stochastic parrots: Can language models be too big?" Proceedings of FAccT, 2021.
- Chen, M. et al. "Evaluating large language models trained on code." arXiv preprint arXiv:2107.03374, 2021.
- Denny, P. et al. "Conversing with copilot: Exploring prompt engineering for solving cs1 problems using natural language." Proceedings of SIGCSE, 2023.
- European Union. Artificial Intelligence Act. Regulamento (UE) 2024/1689. Jornal Oficial da União Europeia, 2024.
- GitHub / Microsoft. "Research: Quantifying GitHub Copilot's impact on developer productivity and happiness." GitHub Blog, 2022.
- Google DeepMind. Gemini: A Family of Highly Capable Multimodal Models. Technical Report, 2024.
- Khoury, R. et al. "How secure is code generated by ChatGPT?" arXiv preprint arXiv:2304.09655, 2023.
- Nascimento, N. et al. "Self-adaptive language models for code generation.", 2023.
- OpenAI. GPT-4 Technical Report. 2023.
- Parasuraman, R.; Manzey, D. "Complacency and bias in human use of automation: An attentional integration." Human Factors, 52(3), 381–410, 2010.
- Pearce, H. et al. "Asleep at the keyboard? Assessing the security of GitHub Copilot's code contributions." IEEE Symposium on Security and Privacy (S&P), 2022.
- Replit. Replit AI features overview. Documentação oficial, 2023.
- Shanahan, M. et al., 2023.
- Sommerville, I. Software Engineering. 10ª edição. Pearson, 2016.
- Stack Overflow. Developer Survey 2024. Stack Overflow, 2024.
- Ziegler, A. et al. "Productivity assessment of neural code completion." Proceedings of the 6th ACM SIGPLAN International Symposium on Machine Programming, 2022.
