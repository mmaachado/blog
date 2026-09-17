---
title: "A História da I.A."
date: 2026-09-16T21:12:59-03:00
draft: true
description: "De Talos ao ChatGPT: como a ideia de máquinas pensantes nasceu, quase morreu duas vezes e voltou, e o papel dos governos em cada ciclo."
tags:
  - engenharia-de-software
  - IA
  - roteiro
---

## Introdução

> **TL;DR**: A I.A. não nasceu com o ChatGPT. Ela nasceu há mais de 80 anos, foi bancada por governos e quase morreu duas vezes quando esses mesmos governos fecharam a torneira. Hoje o jogo virou e ela entrega resultado, virando ativo estratégico de Estado. Os modelos vão continuar crescendo, **só não vai ser para você**.

Há alguns dias li algumas publicações do [Fabio Akita sobre I.A.](https://akitaonrails.com/2026/09/09/propagandas-enganosas-da-openai-anthropic-nvidia/)[^1], principalmente após todo o burburinho causado por [Dario Amodei](https://www.nbcnews.com/news/us-news/anthropic-ceo-dario-amodei-ai-development-rcna597383)[^2] e cia., pedindo que os laboratórios de fronteira desacelerem a evolução dos modelos[^3].

É comum ver o Akita defendendo que boa parte do "_salto_" recente da I.A. vem de força bruta: queimar quantidades absurdas de computação, algo que só meia dúzia de empresas no mundo consegue bancar, e mesmo assim em hardware majoritariamente alugado[^1].

A literatura acadêmica vai na mesma direção. A computação usada para treinar modelos de ponta vem dobrando a cada ~6 meses[^4], e há pesquisadores argumentando que essa trajetória é econômica e tecnicamente insustentável[^5].

Concordo quando o Akita diz que **o maior limitador da I.A.** é o hardware, mas vou um pouco mais além.

Mesmo que tenhamos o hardware suficiente para as I.A.s triplicarem de tamanho nas próximas décadas, **nós, cidadãos comuns, não vamos ter acesso a isso, porque governo nenhum vai deixar**.

E não, não estou falando de governo frear a I.A. por medo do Exterminador do Futuro. Estou falando de dois movimentos que já estão acontecendo ao mesmo tempo:

1. **Para fora, a I.A. virou ativo de soberania**: o governo americano trata a disputa pela I.A. literalmente como uma nova corrida espacial[^6] e controla a exportação de chips avançados desde 2022[^7]. Em junho deste ano, a Anthropic precisou suspender o acesso a dois dos seus modelos para cumprir controles de exportação do Departamento de Comércio dos EUA[^8]. Quem trata uma tecnologia assim não quer pará-la, quer ser o dono dela;
2. **Para dentro, a I.A. virou problema de identidade digital**: União Europeia e Brasil estão empilhando regras sobre regras para rotulagem de conteúdo sintético, deepfakes, verificação de identidade e responsabilidade de plataformas[^9] [^10] [^11]. Cada nova regra vem justificada por "_segurança_" e "_privacidade_", e cada uma estreita um pouco mais o que o usuário final pode fazer;

**NA MINHA OPINIÃO**, o resultado desses dois movimentos é previsível. Os modelos de fronteira vão continuar crescendo, só que dentro de datacenters sob custódia estatal, direta ou regulatória. Para o público, sobra a versão diluída, um chatbot para tirar dúvidas e reestruturar textos, com saída marcada e identificável como gerada por I.A., algo que a UE já exige desde agosto de 2026[^9].

Já modelos com capacidades de gerar conteúdo audiovisual tendem a seguir o caminho de softwares profissionais como o **Visual Studio** ou o **AutoCAD**, com uma camada a mais: uso restrito a empresas, mediante licenciamento, e fiscalização do uso final nos moldes do que a ANPD faz com a LGPD.

**Isso é a minha aposta, não uma profecia**! Mas, antes de discutir para onde a I.A. vai, vale entender de onde ela veio. E a primeira surpresa para muita gente é que a ideia de "_máquinas que pensam_" é mais antiga que o próprio computador, a eletricidade e, em certo sentido, que a própria ciência. A segunda surpresa é que governos sempre estiveram no meio dessa história, às vezes como financiadores e às vezes como freio.

## Antes do silício: mitos, autômatos e robôs

A vontade de criar seres artificiais aparece já na mitologia grega. Na _Ilíada_, Hefesto, o deus ferreiro, é servido por assistentes feitas de ouro que se movem, falam e têm entendimento[^12]. Na _Argonáutica_, de Apolônio de Rodes, aparece Talos, um gigante de bronze que patrulha a ilha de Creta e é derrotado pela feiticeira Medeia[^13]. A historiadora Adrienne Mayor, de Stanford, dedicou um livro inteiro a mostrar que os gregos já imaginavam "_seres feitos, não nascidos_", com mecanismos internos e objetivos programados, séculos antes de existir tecnologia para isso[^14].

A imaginação virou engenharia na Idade Média islâmica. Por volta de 1206, o engenheiro Ismail al-Jazari documentou dezenas de mecanismos automáticos no seu _Livro do Conhecimento de Dispositivos Mecânicos Engenhosos_. Entre eles havia autômatos musicais e servidores mecânicos controlados por água e cames[^15]. Não havia "_inteligência_" ali, mas havia a ideia central da automação: comportamento complexo emergindo de regras mecânicas.

A palavra "_robô_" é bem mais recente, ela vem da peça _R.U.R._ (1920), do tcheco Karel Čapek, derivada de _robota_, associado a trabalho forçado[^16]. E o enredo já trazia o tema que domina as manchetes de 2026: as criaturas artificiais se rebelam contra os criadores.

## A ideia que tornou I.A. possível: pensar é calcular

O mito explica o _desejo_. O que tornou a I.A. _concebível_ foi uma ideia filosófica: raciocinar seria uma forma de computação.

- **Ramon Llull (c. 1305)**, na _Ars Magna_, propôs discos giratórios que combinavam conceitos para gerar proposições de forma sistemática. Foi uma tentativa de mecanizar parte do raciocínio[^17];
- **Thomas Hobbes (1651)**, no capítulo 5 do _Leviatã_, escreveu que a razão "_is nothing but Reckoning (that is, Adding and Subtracting)_"[^18];
- **Gottfried Leibniz (final do séc. XVII)** sonhou com uma _characteristica universalis_, uma linguagem simbólica universal, e um _calculus ratiocinator_ capaz de resolver disputas por cálculo. É o famoso "_Calculemus!_". O matemático Martin Davis usa Leibniz como ponto de partida de uma linha direta até Turing[^19];

O programa de Leibniz só ganhou ferramentas no século XIX e início do XX:

- **George Boole (1854)** algebrizou a lógica em _The Laws of Thought_. É daí que vem a "_álgebra booleana_" que todo programador usa[^20];
- **Gottlob Frege (1879)** criou, no _Begriffsschrift_, a primeira lógica formal de predicados moderna[^21];
- **David Hilbert** e **Wilhelm Ackermann (1928)** formalizaram o _Entscheidungsproblem_. A pergunta era se existiria um procedimento mecânico capaz de decidir se qualquer afirmação lógica é válida[^22];
- **Kurt Gödel (1931)** mostrou, com os teoremas da incompletude, que todo sistema formal consistente e expressivo o suficiente para a aritmética contém verdades que não consegue provar[^23]. Foi o primeiro grande "_limite_" teórico, e ele voltaria décadas depois nos debates sobre se máquinas podem pensar;

## Babbage, Lovelace e a primeira objeção à I.A.

**Charles Babbage** projetou, a partir da década de 1830, a **Máquina Analítica**. Era um computador mecânico de propósito geral, com memória ("_store_"), unidade de processamento ("_mill_") e entrada por cartões perfurados, nunca concluído em vida. Em 1843, **Ada Lovelace** traduziu um artigo do engenheiro italiano Luigi Menabrea sobre a máquina e acrescentou notas mais longas que o texto original[^24].

Duas contribuições dessas notas importam para a nossa história:

1. **Generalidade**: Lovelace percebeu que a máquina manipula símbolos, não apenas números. Por isso poderia, em tese, compor música se as regras da harmonia fossem codificadas (Nota A)[^24]. É a intuição de computação simbólica cem anos antes dela sequer existir;
2. **Ceticismo**: Na Nota G, junto do algoritmo para calcular números de Bernoulli, frequentemente chamado de primeiro programa publicado, ela afirma que a máquina "_has no pretensions whatever to originate any thing. It can do whatever we know how to order it to perform_"[^24].

> Guarde essa frase. Mais de um século depois, Turing a batizaria de "_Objeção de Lady Lovelace_" e dedicaria uma seção inteira a respondê-la[^25].

## Computabilidade: a teoria antes da máquina

Em 1936, dois trabalhos independentes responderam ao desafio de Hilbert, e a resposta foi negativa:

- **Alonzo Church** usou o cálculo _lambda_ para mostrar que não existe um procedimento geral de decisão[^26];
- **Alan Turing**, em _On Computable Numbers_, definiu uma máquina abstrata que lê e escreve símbolos numa fita e provou o mesmo resultado[^27]. O subproduto foi mais importante que o teorema: a **máquina universal**, uma única máquina capaz de simular qualquer outra a partir de uma descrição codificada. É a ideia de software, formalizada.

A ponte entre lógica e eletrônica veio logo depois. Em 1938, **Claude Shannon** mostrou na sua dissertação de mestrado que a álgebra de Boole descreve circuitos de relés. Com isso, qualquer operação lógica poderia ser implementada fisicamente[^28]. Em 1945, o _First Draft of a Report on the EDVAC_, de **John von Neumann**, descreveu a arquitetura de programa armazenado que usamos até hoje[^29].

Em menos de dez anos, "_pensar é calcular_" deixou de ser filosofia. Havia uma teoria do que é computável e havia máquinas capazes de computar.

## Os dois caminhos: neurônios artificiais e cibernética

Enquanto a lógica simbólica avançava, outro grupo buscava inspiração no cérebro.

Em 1943, o neurofisiologista **Warren McCulloch** e o lógico **Walter Pitts** publicaram _A Logical Calculus of the Ideas Immanent in Nervous Activity_. O artigo modelava neurônios como unidades binárias com limiar e mostrava que redes desses "neurônios" podem computar funções lógicas[^30]. É o ancestral direto de toda rede neural moderna.

No mesmo ano, **Rosenblueth**, **Wiener** e **Bigelow** propuseram que comportamento com propósito pode ser explicado por realimentação (_feedback_)[^31]. Em 1948, **Norbert Wiener** batizou o campo de **Cibernética**: o estudo do controle e da comunicação no animal e na máquina[^32]. Em 1949, o psicólogo **Donald Hebb** propôs que conexões entre neurônios se fortalecem quando eles disparam juntos. Essa "_regra de Hebb_" é a primeira teoria plausível de aprendizado em redes[^33].

Shannon, por sua vez, publicou em 1950 _Programming a Computer for Playing Chess_. O artigo define a busca em árvore com função de avaliação, que seria a base de programas de xadrez por quase meio século[^34].

Aqui nasce a divisão que atravessa toda a história da I.A.:

| Abordagem    | Premissa                                                         | Herdeiros                                      |
| ------------ | ---------------------------------------------------------------- | ---------------------------------------------- |
| Simbólica    | Inteligência = manipulação de símbolos com regras explícitas     | Lógica, sistemas especialistas, LISP           |
| Conexionista | Inteligência = emergente de muitas unidades simples que aprendem | Perceptron, redes neurais, deep learning, LLMs |

## 1950: "_Can machines think?_"

O artigo _Computing Machinery and Intelligence_, publicado por Turing na revista _Mind_ em 1950, é o texto fundador do debate moderno[^25]. Turing considerava a pergunta "_máquinas podem pensar?_" mal definida e a substituiu por um experimento: o **Jogo da Imitação**, hoje chamado de **Teste de Turing**. Um interrogador conversa por texto com um humano e uma máquina. Se não conseguir distinguir os dois de forma confiável, não haveria base prática para negar inteligência à máquina.

O artigo é mais do que o teste. Nele, Turing:

- **Fez uma previsão concreta**. Em cerca de 50 anos, máquinas com ~$10^9$ bits de armazenamento jogariam o jogo tão bem que um interrogador médio não teria mais de 70% de chance de acertar após cinco minutos[^25];
- **Respondeu objeções**, incluindo a teológica, a matemática (baseada em Gödel) e a de Lady Lovelace[^25];
- **Propôs máquinas que aprendem**. Em vez de programar um adulto, sugeriu simular uma "_mente de criança_" e educá-la[^25]. Essa ideia já aparecia no relatório _Intelligent Machinery_ (1948), onde ele descreve "_máquinas desorganizadas_" e redes que poderiam ser treinadas[^35].

Ou seja, em 1950 já estavam na mesa os ingredientes centrais: critério comportamental de inteligência, previsão de escala de memória e aprendizado em vez de programação explícita.

## 1956: Dartmouth e o nascimento do nome

O termo "_inteligência artificial_" aparece na proposta de 31 de agosto de 1955 assinada por **John McCarthy** (Dartmouth), **Marvin Minsky** (Harvard), **Nathaniel Rochester** (IBM) e **Claude Shannon** (Bell Labs). Eles pediam financiamento à Fundação Rockefeller para um workshop de verão em 1956[^36].

A proposta partia de uma conjectura ousada: todo aspecto do aprendizado ou de qualquer outra característica da inteligência poderia, em princípio, ser descrito com precisão suficiente para uma máquina simulá-lo[^36]. Entre os temas listados estavam o uso de linguagem por computadores, redes neurais, abstração, autoaperfeiçoamento e aleatoriedade/criatividade[^36].

O nome foi uma escolha deliberada. McCarthy relatou em entrevistas e textos posteriores que escolheu "_artificial intelligence_" em parte para se distanciar da Cibernética e da figura de Wiener. A versão aparece em relatos históricos[^37].

O resultado concreto mais marcante do workshop foi o **Logic Theorist**, de **Allen Newell**, **Cliff Shaw** e **Herbert Simon**. O programa provava teoremas do _Principia Mathematica_ de Russell e Whitehead usando busca heurística[^38]. É amplamente citado que ele provou 38 dos 52 primeiros teoremas do capítulo 2 do _Principia_, e que uma das provas era mais elegante que a original[^39].

Por convenção, Dartmouth 1956 é tratado como o "_nascimento_" da I.A. como disciplina acadêmica[^37][^39].

## Os anos dourados (1956~1973)

Os primeiros anos produziram resultados que pareciam mágicos para a época:

- **Arthur Samuel (IBM, 1959)** publicou um programa de damas que melhorava jogando contra si mesmo. O título do artigo popularizou o termo **machine learning**[^40];
- **Frank Rosenblatt (1958)** apresentou o **Perceptron**, um modelo de neurônio com pesos ajustáveis que aprendia a classificar padrões[^41]. O projeto recebeu financiamento da Marinha americana (Office of Naval Research) e virou hardware: o Mark I Perceptron. A cobertura do New York Times de 8 e 13 de julho de 1958 sugeria que a Marinha esperava uma máquina capaz de perceber, reconhecer e identificar os seus arredores sem treinamento ou controle humano[^42].
- **John McCarthy (1958~1960)** criou o **LISP**, que se tornaria a língua franca da I.A. por décadas e introduziu ideias como coleta de lixo (garbage collector) e código como dado[^43];
- **Newell**, **Shaw** e **Simon (1959)** desenvolveram o **General Problem Solver (GPS)**, que separava o conhecimento do problema da estratégia de busca[^44];
- **Joseph Weizenbaum (MIT, 1966)** criou o **ELIZA**, um programa de conversação baseado em casamento de padrões[^45]. Weizenbaum ficou alarmado com a facilidade com que as pessoas atribuíam compreensão e empatia ao programa, e passou a criticar o campo[^46]. É o primeiro caso documentado do que hoje chamamos de "_efeito ELIZA_", e ele é diretamente relevante para a era dos chatbots;

O otimismo era proporcional. Em 1958, Simon e Newell previam que, em dez anos, um computador seria campeão mundial de xadrez e descobriria e provaria um teorema matemático importante[^47]. Em 1961, Minsky publicou _Steps Toward Artificial Intelligence_, um mapa do campo com busca, reconhecimento de padrões, aprendizado, planejamento e indução[^48].

Quase nenhuma dessas previsões saiu no prazo. O xadrez levou 39 anos em vez de 10.

## O primeiro inverno: quando os governos puxaram o freio

Aqui a história conversa diretamente com a tese da introdução. A I.A. dos anos 1950~1970 era **financiada majoritariamente por governos**, sobretudo pelas agências militares americanas e britânicas. Quando as promessas não se cumpriram, esses mesmos governos cortaram o dinheiro.

**Tradução automática: o relatório ALPAC (EUA, 1966)**. Em 1954, o experimento Georgetown-IBM demonstrou a tradução automática de frases do russo para o inglês e gerou expectativas enormes em plena Guerra Fria[^49]. Após anos de investimento, o comitê ALPAC da Academia Nacional de Ciências concluiu que a tradução automática era mais lenta, menos precisa e mais cara que a humana, e recomendou redirecionar recursos para pesquisa básica em linguística computacional[^50]. O financiamento federal para a área despencou.

**Perceptrons (1969)**. Minsky e Papert publicaram _Perceptrons_, uma análise matemática que demonstrava limitações do perceptron de camada única. Ele não consegue, por exemplo, representar funções como XOR ou decidir conectividade[^51]. A narrativa popular diz que o livro "_matou_" as redes neurais por uma década. O sociólogo Mikel Olazaran mostrou que a história é mais complexa, com disputas por financiamento e legitimidade entre as abordagens simbólica e conexionista[^52].

**O Relatório Lighthill (Reino Unido, 1973)**. O governo britânico encomendou ao matemático Sir James Lighthill uma avaliação do campo. A conclusão foi dura: fora de nichos, a I.A. não havia cumprido suas promessas. O principal obstáculo era a explosão combinatória, porque técnicas que funcionam em "_mundos de brinquedo_" não escalam para problemas reais[^53]. O relatório é frequentemente associado ao corte de financiamento de I.A. no Reino Unido, com poucos centros sobrevivendo (como Edimburgo).

**A Emenda Mansfield (EUA, 1969)**. A Seção 203 da Lei de Autorização Militar para o ano fiscal de 1970 (Public Law 91-121) passou a exigir que pesquisa financiada pelo Departamento de Defesa tivesse relevância militar direta[^54]. Relatos históricos associam essa mudança, somada à frustração com projetos como o de reconhecimento de fala, à redução de verbas "_de exploração_" da DARPA para I.A. no início dos anos 70[^37] [^55].

**Críticas filosóficas**. Hubert Dreyfus, contratado pela RAND Corporation, publicou em 1965 _Alchemy and Artificial Intelligence_. O texto argumentava que a I.A. simbólica ignorava o papel do conhecimento tácito e do corpo na inteligência humana[^56]. O livro _What Computers Can't Do_ (1972) expandiu a crítica[^57].

Note o padrão: **governos não frearam a I.A. porque ela era poderosa demais, e sim porque ela prometeu demais e entregou de menos**.

## Sistemas especialistas, corrida estatal e o segundo inverno (1980~1993)

A I.A. voltou nos anos 80 com uma proposta mais modesta e comercial: **sistemas especialistas**, programas que codificam conhecimento de especialistas humanos em regras "_se-então_".

- **DENDRAL (Stanford, a partir de 1965)** inferia estruturas moleculares a partir de dados de espectrometria de massa[^58];
- **MYCIN (Stanford, anos 70)** recomendava antibióticos para infecções sanguíneas e lidava com incerteza usando "_fatores de certeza_"[^59];
- **R1/XCON (Digital Equipment Corporation, 1980)** configurava pedidos de computadores VAX em ambiente de produção real[^60]. Estimativas frequentemente citadas falam em dezenas de milhões de dólares economizados por ano[^55];

E os governos voltaram, desta vez como **aceleradores**, numa corrida tecnológica:

- **Japão (1982)**: o Ministério do Comércio Internacional e Indústria (MITI) lançou o projeto **Quinta Geração de Computadores (FGCS)**, com o objetivo de construir máquinas de inferência lógica em larga escala[^61];
- **EUA (1983)**: a DARPA respondeu com a **Strategic Computing Initiative**, que financiou I.A., hardware e aplicações militares[^62];
- **Reino Unido (1983)**: lançou o **Programa Alvey**[^55];

O resultado se repetiu. Sistemas especialistas eram caros de manter, frágeis fora do domínio e incapazes de aprender. O mercado de hardware especializado (máquinas LISP) perdeu para estações de trabalho genéricas, e os projetos estatais não atingiram suas metas[^55] [^62]. O termo "_A.I. winter_" teria sido cunhado em um debate na conferência anual da AAAI em 1984, em que pesquisadores alertaram para uma bolha prestes a estourar[^55].

## O retorno silencioso: redes neurais e estatística (1980~2011)

Enquanto os sistemas especialistas caíam, a abordagem conexionista se reconstruía com menos holofote.

**O algoritmo que faltava: backpropagation**. O problema apontado por Minsky e Papert era treinar redes com camadas ocultas. A solução matemática, a diferenciação automática em modo reverso, foi descrita por **Seppo Linnainmaa** (1970~1976)[^63]. **Paul Werbos** propôs aplicá-la a redes neurais em sua tese de 1974[^64]. O método ficou famoso com o artigo de **Rumelhart**, **Hinton** e **Williams** na _Nature_ (1986), que mostrou redes aprendendo representações internas úteis[^65]. A atribuição de crédito nessa história é disputada; Jürgen Schmidhuber mantém um levantamento detalhado das origens[^66].

Outros marcos:

- **Neocognitron (Fukushima, 1980)**: arquitetura hierárquica inspirada no córtex visual, precursora das redes convolucionais[^67];
- **Redes de Hopfield (1982)**: memória associativa baseada em energia, que conectou redes neurais à física estatística[^68];
- **Redes convolucionais (LeCun et al., 1989)**: backpropagation aplicado ao reconhecimento de dígitos manuscritos em códigos postais[^69];
- **LSTM (Hochreiter & Schmidhuber, 1997)**: resolveu o problema do gradiente que desaparece em redes recorrentes e dominou o processamento de sequências por duas décadas[^70];

Paralelamente, a I.A. ficou **estatística**. **Judea Pearl** formalizou o raciocínio probabilístico com redes bayesianas[^71]. **Cortes** e **Vapnik** introduziram as **Support Vector Machines** (1995), que dominaram a classificação por anos com garantias teóricas sólidas[^72].

E a previsão de Simon sobre xadrez finalmente se cumpriu, com 29 anos de atraso. Em 1997, o **Deep Blue** da IBM venceu o campeão mundial Garry Kasparov num match[^73]. Detalhe importante: o Deep Blue usava busca massiva com hardware dedicado e funções de avaliação ajustadas, não aprendizado profundo[^73]. A vitória veio de **força bruta computacional**, um tema que volta no fim deste texto.

## 2006~2016: a explosão do deep learning

Três fatores convergiram:

1. **Algoritmos**: Hinton, Osindero e Teh (2006) mostraram como pré-treinar redes profundas camada por camada, reacendendo o interesse no "_deep_" learning[^74];
2. **Hardware**: Raina, Madhavan e Ng (2009) demonstraram que **GPUs** aceleravam o treinamento de redes em ordens de grandeza[^75];
3. **Dados**: o **ImageNet** (Deng et al., 2009) forneceu milhões de imagens rotuladas em milhares de categorias[^76];

O ponto de virada foi em 2012. A **AlexNet** (Krizhevsky, Sutskever e Hinton), treinada em duas GPUs, venceu a competição ImageNet com erro top-5 de 15,3%, contra 26,2% do segundo colocado[^77]. Em poucos anos, visão computacional, reconhecimento de fala e tradução migraram para redes profundas[^78].

Na sequência:

- **2013**: _word2vec_ popularizou representações vetoriais densas de palavras (_embeddings_)[^79];
- **2014**: o mecanismo de **atenção** para tradução neural (Bahdanau, Cho e Bengio) permitiu que o modelo "_olhasse_" para partes relevantes da entrada[^80];
- **2016**: o **AlphaGo**, da DeepMind, combinou redes profundas, aprendizado por reforço e busca em árvore e venceu Lee Sedol no Go[^81], um jogo considerado intratável por força bruta pura;
- **2019**: Hinton, LeCun e Bengio receberam o **Prêmio Turing** de 2018 pelo trabalho em deep learning[^82];

## 2017~2022: Transformers, escala e o ChatGPT

Em 2017, pesquisadores do Google publicaram _Attention Is All You Need_. O artigo apresentou o **Transformer**, arquitetura que descarta a recorrência e usa só atenção, o que permite paralelizar o treinamento em GPUs[^83]. Praticamente todo LLM atual descende desse artigo.

A partir daí, a história é de **escala**:

- **GPT (OpenAI, 2018)**: pré-treinamento generativo não supervisionado seguido de ajuste fino[^84]. No mesmo ano, o Google publicou o BERT[^85];
- **Leis de escala (Kaplan et al., 2020)**: o desempenho de modelos de linguagem melhora de forma previsível, como lei de potência, com mais parâmetros, dados e computação[^86]. **Hoffmann et al. (2022)**, com o "_Chinchilla_", corrigiram a receita: para um mesmo orçamento de computação, a maioria dos modelos estava subtreinada em dados[^87];
- **GPT-3 (2020)**: 175 bilhões de parâmetros, com capacidade de executar tarefas a partir de poucos exemplos no próprio prompt (_few-shot_)[^88];
- **RLHF**: Christiano et al. (2017) propuseram aprendizado por reforço a partir de preferências humanas[^89]. A OpenAI aplicou a técnica no InstructGPT (2022) para alinhar o modelo a instruções[^90];
- **30 de novembro de 2022**: a OpenAI lança o **ChatGPT**[^91]. A marca de 100 milhões de usuários em dois meses, atribuída a uma nota do UBS reportada pela Reuters em fevereiro de 2023, circulou amplamente;

Em 2024, o Nobel de Física foi para **John Hopfield** e **Geoffrey Hinton** por descobertas fundamentais que permitem o aprendizado de máquina com redes neurais artificiais[^92]. O prêmio encerra simbolicamente o arco que começou com McCulloch e Pitts em 1943.

> E é aqui que eu constato a afirmação que fiz no TL;DR desse post: **o conceito de I.A. não nasceu com o ChatGPT**. O ChatGPT é **o produto de 80 anos de pesquisa acumulada**, dois invernos e muito dinheiro público.

## O padrão que se repete: computação, promessas e o Estado

Voltando à provocação da introdução, a história oferece dois padrões que ajudam a pensar sobre o futuro.

### O progresso sempre dependeu da computação

Richard Sutton resumiu 70 anos de pesquisa no ensaio _The Bitter Lesson_ (2019). A lição é que métodos gerais que escalam com computação (busca e aprendizado) acabam vencendo métodos que embutem conhecimento humano[^93]. O Deep Blue, a AlexNet e as leis de escala confirmam isso[^73] [^77] [^86].

O outro lado da moeda é o custo. **Sevilla et al. (2022)** estimaram que a computação usada para treinar modelos de ponta dobrou a cada ~6 meses desde o início da era do deep learning (~2010)[^4]. **Thompson et al. (2020)** argumentaram que a dependência de computação torna a trajetória atual econômica, técnica e ambientalmente insustentável se nada mudar[^5]. Esse é o argumento mais sólido, com literatura revisada, para a tese de que o **hardware é o gargalo**.

### O Estado sempre esteve na mesa, nos dois papéis

Resumo histórico do que vimos:

| Período   | Governo como acelerador                                            | Governo como freio                                |
| --------- | ------------------------------------------------------------------ | ------------------------------------------------- |
| 1950~1960 | Financiamento militar (ONR, DARPA)[^41] [^37]                      | —                                                 |
| 1966~1974 | —                                                                  | ALPAC[^50], Lighthill[^53], Emenda Mansfield[^54] |
| 1982~1990 | FGCS (Japão)[^61], Strategic Computing (EUA)[^62], Alvey (UK)[^55] | Cortes após metas não atingidas[^55] [^62]        |

E hoje:

- **União Europeia**: o **AI Act** (Regulamento (UE) 2024/1689) não proíbe modelos grandes. Ele impõe obrigações adicionais a modelos de propósito geral com "_risco sistêmico_" e presume esse risco quando o treino ultrapassa $10^{25}$ **FLOPs** (art. 51)[^94];
- **EUA (federal)**: a **Ordem Executiva 14110** (out/2023) exigia reportar treinamentos acima de $10^{26}$ operações e foi revogada em jan/2025[^95]. Os EUA também impuseram controles de exportação de chips avançados a partir de out/2022, mirando adversários geopolíticos, não o tamanho dos modelos domésticos[^7];
- **EUA (estadual)**: o projeto **SB 1047** da Califórnia, que impunha obrigações de segurança a modelos de fronteira, foi vetado pelo governador em set/2024[^96];
- **Junho de 2026**: a **Anthropic** suspendeu o acesso aos modelos **Claude Fable 5** e **Mythos 5** para cumprir controles de exportação do _Departamento de Comércio dos EUA_. Os controles foram retirados em 30/06 e o acesso foi restaurado em 01/07[^8];
- **Setembro de 2026**: laboratórios de ponta propuseram publicamente desacelerar ("_pacing the frontier_"), e o ensaio de Amodei pede apoio governamental, inclusive uma isenção antitruste, para que a coordenação seja viável[^3][^2]. Segundo o _Washington Post_, citado por Akita, o presidente Trump rejeitou os pedidos de desaceleração citando a competição com a China[^97] [^1]. Segundo a Reuters, também citada por Akita, negociadores do Senado discutiam um "_dever de cuidado_" para riscos catastróficos[^98] [^1];

## Conclusão

### O padrão se repete, mas o papel do Estado mudou

Se você chegou até aqui, percebeu o padrão. Nos anos 60 e 70, os governos frearam a I.A. porque ela prometeu demais e entregou de menos. ALPAC, Lighthill e a Emenda Mansfield cortaram verba de uma tecnologia que não funcionava fora de mundos de brinquedo[^50] [^53] [^54]. Nos anos 80, esses mesmos governos voltaram a acelerar quando a I.A. virou disputa entre nações, e Japão, EUA e Reino Unido despejaram dinheiro público em programas estratégicos[^61] [^62] [^55].

A diferença é que, desta vez, **a I.A. entrega resultado**. E tecnologia que entrega resultado não tem a verba cortada, mas sim custodiada.

### A I.A. como moeda de soberania

O plano de I.A. da Casa Branca abre afirmando que os EUA estão numa corrida pela dominância global em I.A., que quem tiver o maior ecossistema vai colher benefícios econômicos e militares, e compara a disputa à corrida espacial[^6]. Não é retórica solta: os EUA controlam a exportação de chips avançados desde 2022[^7]. Em junho de 2026, uma empresa americana precisou suspender o acesso a modelos de linguagem para cumprir controles de exportação[^8]. E quando os próprios laboratórios pediram para desacelerar, a Casa Branca teria recusado citando a China[^97].

Nós já vimos esse filme. Em 1946, os EUA aprovaram o _Atomic Energy Act_, que colocou o conhecimento nuclear sob controle estatal[^99]. Nos anos 90, criptografia forte chegou a ser tratada como munição para fins de exportação[^100]. Em nenhum dos dois casos o Estado proibiu a tecnologia: ele decidiu quem podia usá-la e em que escala.

É exatamente o cenário que eu vejo: governo nenhum vai abrir mão de ter o modelo mais poderoso. O que ele não vai deixar é você ter.

### A I.A. como ameaça à identidade digital

A outra ponta aperta pelo lado do usuário:

- **União Europeia**: desde 2 de agosto de 2026, conteúdo gerado por I.A. precisa carregar marcação legível por máquina e deepfakes precisam ser rotulados (AI Act, art. 50)[^9] [^94]. Em paralelo, o bloco implanta a carteira europeia de identidade digital (eIDAS 2.0)[^101];
- **Brasil**: o ECA Digital, em vigor desde 17 de março de 2026, proíbe a autodeclaração de idade e exige verificação etária confiável em plataformas com conteúdo impróprio para menores, inclusive lojas de aplicativos[^11]. Para as eleições de 2026, o TSE proibiu deepfakes em propaganda eleitoral e vetou a publicação de novos conteúdos sintéticos com imagem ou voz de candidatos entre 72 horas antes e 24 horas depois da votação, mesmo quando rotulados[^102] [^10]. E o Marco Legal da I.A. (PL 2338/2023) segue na Câmara, com um projeto apensado que obriga marca d'água em imagens, vídeos e áudios gerados por I.A.[^103] [^104];
- **Bloqueios diretos**: a Itália bloqueou o ChatGPT em 2023[^105], a ANPD mandou a Meta suspender o treinamento de I.A. com dados de brasileiros em 2024[^106], e Indonésia e Malásia bloquearam o Grok em janeiro de 2026 após uma onda de deepfakes sexuais[^107];

Sendo honesto: nenhuma dessas normas proíbe, hoje, gerar conteúdo audiovisual com I.A. O que existe é rotulagem, restrição por contexto e bloqueio pontual. A minha aposta está na direção do movimento: de "_rotular_" para "_licenciar_".

No Brasil, isso nem seria novidade. Transmitir áudio e vídeo em larga escala, via rádio e TV, sempre dependeu de concessão do Poder Executivo[^108]. Quando qualquer pessoa consegue produzir, com um prompt, um vídeo realista de um político dizendo o que nunca disse, não é difícil imaginar o legislador puxando o audiovisual generativo para a mesma lógica: primeiro nas eleições, depois para todo o resto. O meme do político gerado no GPT ou no Gemini é o primeiro candidato a virar "_conteúdo sem licença_".

### "_Mas os modelos já estão por aí_"

É o contra-argumento mais forte, e precisa ser enfrentado. Modelos com pesos abertos, como o DeepSeek-R1, podem ser baixados por qualquer um[^109], e o próprio plano americano diz incentivar modelos abertos[^6]. E, na guerra da criptografia dos anos 90, o Estado acabou recuando[^100].

A minha resposta volta ao ponto de partida deste texto: o arquivo é livre, o silício não é. Baixar os pesos é fácil; treinar ou rodar um modelo de fronteira exige datacenters com chips cuja exportação já é controlada[^7] [^5]. E o usuário médio não roda modelo local: ele usa um aplicativo, que passa por uma loja de aplicativos, que já é obrigada a verificar a idade de quem usa[^11]. O controle não precisa estar no modelo. Basta estar no hardware e na distribuição.

### Então...

A história da I.A. é a história de uma ideia que os governos financiaram quando parecia promissora, abandonaram quando decepcionou e agora disputam quando finalmente funciona.

A I.A. vai sim triplicar de tamanho, mas muito provavelmente não vai triplicar para nós.

Posso estar errado, e sinceramente adoraria estar. Se discorda, ou tem alguma observação, deixa o seu comentário abaixo.

## Bibliografia

[^1]: AKITA, Fabio. _Você é um idiota se acredita nas propagandas enganosas da OpenAI, Anthropic, NVIDIA, DeepSeek. Entenda_. AkitaOnRails, 9 set. 2026. [https://akitaonrails.com/2026/09/09/propagandas-enganosas-da-openai-anthropic-nvidia/](https://akitaonrails.com/2026/09/09/propagandas-enganosas-da-openai-anthropic-nvidia/)

[^2]: NBC NEWS. _Two of the world's top AI chief executives publicly agree on slowing AI development_. Set. 2026. [https://www.nbcnews.com/news/us-news/anthropic-ceo-dario-amodei-ai-development-rcna597383](https://www.nbcnews.com/news/us-news/anthropic-ceo-dario-amodei-ai-development-rcna597383)

[^3]: AMODEI, Dario. We Must Pace the Frontier. 12 set. 2026. https://darioamodei.com/post/we-must-pace-the-frontier

[^4]: SEVILLA, J. et al. Compute Trends Across Three Eras of Machine Learning. 2022. https://arxiv.org/abs/2202.05426

[^5]: THOMPSON, N. C. et al. The Computational Limits of Deep Learning. 2020. https://arxiv.org/abs/2007.05558

[^6]: THE WHITE HOUSE. Winning the Race: America's AI Action Plan. Jul. 2025. https://www.whitehouse.gov/wp-content/uploads/2025/07/Americas-AI-Action-Plan.pdf

[^7]: U.S. DEPARTMENT OF COMMERCE, BIS. Regras de controle de exportação de computação avançada e semicondutores, 7 out. 2022 (87 FR 62186).

[^8]: ANTHROPIC. Comunicado sobre suspensão e restauração do acesso ao Claude Fable 5 e Mythos 5 (jun./jul. 2026). https://www.anthropic.com/news/fable-mythos-access

[^9]: EUROPEAN COMMISSION. Transparency obligations under Article 50 of the AI Act (FAQ). 2026. https://digital-strategy.ec.europa.eu/en/faqs/transparency-obligations-under-article-50-ai-act

[^10]: TRIBUNAL SUPERIOR ELEITORAL. TSE fixa tese sobre deepfake e delimita regra para as Eleições 2026. Set. 2026. https://www.tse.jus.br/comunicacao/noticias/2026/Setembro/tse-fixa-tese-sobre-deepfake-e-delimita-regra-para-as-eleicoes-2026

[^11]: BRASIL. Lei nº 15.211, de 17 de setembro de 2025 (ECA Digital). Resumo: MACHADO MEYER. Estatuto Digital da Criança e do Adolescente entra em vigor em 17 de março de 2026. https://www.machadomeyer.com.br/pt/inteligencia-juridica/publicacoes-ij/direito-digital/estatuto-digital-da-crianca-e-do-adolescente-lei-n-15-211-2025-entra-em-vigor-em-17-de-marco-de-2026

[^12]: HOMERO. _Ilíada_, Canto XVIII (v. ~417–421). Tradução em inglês (Samuel Butler), Project Gutenberg. [https://www.gutenberg.org/ebooks/2199](https://www.gutenberg.org/ebooks/2199)

[^13]: APOLÔNIO DE RODES. _Argonáutica_, Livro IV (episódio de Talos).

[^14]: MAYOR, Adrienne. _Gods and Robots: Myths, Machines, and Ancient Dreams of Technology_. Princeton: Princeton University Press, 2018.

[^15]: AL-JAZARI, Ismail. _The Book of Knowledge of Ingenious Mechanical Devices_ (c. 1206). Trad. Donald R. Hill. Dordrecht: D. Reidel, 1974.

[^16]: ČAPEK, Karel. _R.U.R. (Rossum's Universal Robots)_. 1920. [https://www.gutenberg.org/ebooks/59112](https://www.gutenberg.org/ebooks/59112)

[^17]: STANFORD ENCYCLOPEDIA OF PHILOSOPHY. _Ramon Llull_. [https://plato.stanford.edu/entries/llull/](https://plato.stanford.edu/entries/llull/)

[^18]: HOBBES, Thomas. _Leviathan_. 1651. Cap. 5. [https://www.gutenberg.org/ebooks/3207](https://www.gutenberg.org/ebooks/3207)

[^19]: DAVIS, Martin. _The Universal Computer: The Road from Leibniz to Turing_. New York: W. W. Norton, 2000. (Publicado também como _Engines of Logic_.)

[^20]: BOOLE, George. An Investigation of the Laws of Thought. London: Walton and Maberly, 1854. https://www.gutenberg.org/ebooks/15114

[^21]: FREGE, Gottlob. Begriffsschrift. Halle: Louis Nebert, 1879.

[^22]: HILBERT, David; ACKERMANN, Wilhelm. Grundzüge der theoretischen Logik. Berlin: Springer, 1928.

[^23]: GÖDEL, Kurt. Über formal unentscheidbare Sätze der Principia Mathematica und verwandter Systeme I. Monatshefte für Mathematik und Physik, v. 38, p. 173–198, 1931. https://doi.org/10.1007/BF01700692

[^24]: MENABREA, L. F.; LOVELACE, Ada (trad. e notas). Sketch of the Analytical Engine Invented by Charles Babbage. Scientific Memoirs, v. 3, p. 666–731, 1843. https://www.fourmilab.ch/babbage/sketch.html

[^25]: TURING, Alan M. Computing Machinery and Intelligence. Mind, 59(236), p. 433–460, 1950. https://doi.org/10.1093/mind/LIX.236.433

[^26]: CHURCH, Alonzo. An Unsolvable Problem of Elementary Number Theory. American Journal of Mathematics, 58(2), p. 345–363, 1936. https://doi.org/10.2307/2371045

[^27]: TURING, Alan M. On Computable Numbers, with an Application to the Entscheidungsproblem. Proceedings of the London Mathematical Society, s2-42(1), p. 230–265, 1936/1937. https://doi.org/10.1112/plms/s2-42.1.230

[^28]: SHANNON, Claude E. A Symbolic Analysis of Relay and Switching Circuits. Transactions of the AIEE, 57(12), p. 713–723, 1938. https://doi.org/10.1109/T-AIEE.1938.5057767

[^29]: VON NEUMANN, John. First Draft of a Report on the EDVAC (1945). Reimpr. IEEE Annals of the History of Computing, 15(4), p. 27–75, 1993. https://doi.org/10.1109/85.238389

[^30]: McCULLOCH, Warren S.; PITTS, Walter. A Logical Calculus of the Ideas Immanent in Nervous Activity. _Bulletin of Mathematical Biophysics_, 5, p. 115–133, 1943. [https://doi.org/10.1007/BF02478259](https://doi.org/10.1007/BF02478259)

[^31]: ROSENBLUETH, Arturo; WIENER, Norbert; BIGELOW, Julian. Behavior, Purpose and Teleology. _Philosophy of Science_, 10(1), p. 18–24, 1943. [https://doi.org/10.1086/286788](https://doi.org/10.1086/286788)

[^32]: WIENER, Norbert. Cybernetics: Or Control and Communication in the Animal and the Machine. Cambridge, MA: MIT Press, 1948.

[^33]: HEBB, Donald O. The Organization of Behavior. New York: Wiley, 1949.

[^34]: SHANNON, Claude E. Programming a Computer for Playing Chess. Philosophical Magazine, ser. 7, 41(314), p. 256–275, 1950. https://doi.org/10.1080/14786445008521796

[^35]: TURING, Alan M. Intelligent Machinery. Relatório, National Physical Laboratory, 1948. Publicado em MELTZER, B.; MICHIE, D. (eds.). Machine Intelligence 5. Edinburgh University Press, 1969.

[^36]: McCARTHY, J.; MINSKY, M.; ROCHESTER, N.; SHANNON, C. A Proposal for the Dartmouth Summer Research Project on Artificial Intelligence (31 ago. 1955). Reimpr. AI Magazine, 27(4), p. 12, 2006. https://doi.org/10.1609/aimag.v27i4.1904 http://jmc.stanford.edu/articles/dartmouth/dartmouth.pdf

[^37]: NILSSON, Nils J. The Quest for Artificial Intelligence: A History of Ideas and Achievements. Cambridge University Press, 2010. PDF gratuito do autor: https://ai.stanford.edu/~nilsson/QAI/qai.pdf

[^38]: NEWELL, Allen; SIMON, Herbert A. The Logic Theory Machine: A Complex Information Processing System. IRE Transactions on Information Theory, 2(3), p. 61–79, 1956. https://doi.org/10.1109/TIT.1956.1056797

[^39]: McCORDUCK, Pamela. Machines Who Think. 2. ed. Natick, MA: A K Peters, 2004.

[^40]: SAMUEL, Arthur L. Some Studies in Machine Learning Using the Game of Checkers. IBM Journal of Research and Development, 3(3), p. 210–229, 1959. https://doi.org/10.1147/rd.33.0210

[^41]: ROSENBLATT, Frank. The Perceptron: A Probabilistic Model for Information Storage and Organization in the Brain. Psychological Review, 65(6), p. 386–408, 1958. https://doi.org/10.1037/h0042519

[^42]: THE NEW YORK TIMES. New Navy Device Learns by Doing. 8 jul. 1958. https://www.nytimes.com/1958/07/08/archives/new-navy-device-learns-by-doing-psychologist-shows-embryo-of.html. Electronic 'Brain' Teaches Itself - July 13, 1958, Section E, Page 9. https://www.nytimes.com/1958/07/13/archives/electronic-brain-teaches-itself.html

[^43]: McCARTHY, John. Recursive Functions of Symbolic Expressions and Their Computation by Machine, Part I. Communications of the ACM, 3(4), p. 184–195, 1960. https://doi.org/10.1145/367177.367199

[^44]: NEWELL, A.; SHAW, J. C.; SIMON, H. A. Report on a General Problem-Solving Program. Proceedings of the International Conference on Information Processing, Paris: UNESCO, 1959.

[^45]: WEIZENBAUM, Joseph. ELIZA — A Computer Program for the Study of Natural Language Communication Between Man and Machine. Communications of the ACM, 9(1), p. 36–45, 1966. https://doi.org/10.1145/365153.365168

[^46]: WEIZENBAUM, Joseph. Computer Power and Human Reason. San Francisco: W. H. Freeman, 1976.

[^47]: SIMON, Herbert A.; NEWELL, Allen. Heuristic Problem Solving: The Next Advance in Operations Research. Operations Research, 6(1), p. 1–10, 1958. https://doi.org/10.1287/opre.6.1.1

[^48]: MINSKY, Marvin. Steps Toward Artificial Intelligence. Proceedings of the IRE, 49(1), p. 8–30, 1961. https://doi.org/10.1109/JRPROC.1961.287775

[^49]: HUTCHINS, W. John. The Georgetown-IBM Experiment Demonstrated in January 1954. In: Machine Translation: From Real Users to Research (AMTA 2004), LNCS 3265. Springer, 2004.

[^50]: ALPAC. Language and Machines: Computers in Translation and Linguistics. Washington, DC: National Academy of Sciences, National Research Council, 1966 (Publication 1416).

[^51]: MINSKY, Marvin; PAPERT, Seymour. Perceptrons: An Introduction to Computational Geometry. Cambridge, MA: MIT Press, 1969.

[^52]: OLAZARAN, Mikel. A Sociological Study of the Official History of the Perceptrons Controversy. Social Studies of Science, 26(3), p. 611–659, 1996. https://doi.org/10.1177/030631296026003005

[^53]: LIGHTHILL, James. Artificial Intelligence: A General Survey. In: Artificial Intelligence: a paper symposium. London: Science Research Council, 1973. http://www.chilton-computing.org.uk/inf/literature/reports/lighthill_report/p001.htm

[^54]: ESTADOS UNIDOS. Public Law 91-121 (Military Procurement Authorization Act, FY1970), Seção 203 ("Emenda Mansfield"), 1969.

[^55]: CREVIER, Daniel. AI: The Tumultuous History of the Search for Artificial Intelligence. New York: Basic Books, 1993.

[^56]: DREYFUS, Hubert L. Alchemy and Artificial Intelligence. RAND Corporation, P-3244, 1965. https://www.rand.org/pubs/papers/P3244.html

[^57]: DREYFUS, Hubert L. What Computers Can't Do. New York: Harper & Row, 1972.

[^58]: LINDSAY, R. K.; BUCHANAN, B. G.; FEIGENBAUM, E. A.; LEDERBERG, J. DENDRAL: A Case Study of the First Expert System for Scientific Hypothesis Formation. Artificial Intelligence, 61(2), p. 209–261, 1993. https://doi.org/10.1016/0004-3702(93)90068-M

[^59]: SHORTLIFFE, Edward H. Computer-Based Medical Consultations: MYCIN. New York: Elsevier, 1976.

[^60]: McDERMOTT, John. R1: A Rule-Based Configurer of Computer Systems. Artificial Intelligence, 19(1), p. 39–88, 1982. https://doi.org/10.1016/0004-3702(82)90021-2

[^61]: FEIGENBAUM, Edward A.; McCORDUCK, Pamela. The Fifth Generation: Artificial Intelligence and Japan's Computer Challenge to the World. Reading, MA: Addison-Wesley, 1983.

[^62]: ROLAND, Alex; SHIMAN, Philip. Strategic Computing: DARPA and the Quest for Machine Intelligence, 1983–1993. Cambridge, MA: MIT Press, 2002.

[^63]: LINNAINMAA, Seppo. Taylor Expansion of the Accumulated Rounding Error. BIT Numerical Mathematics, 16(2), p. 146–160, 1976. https://doi.org/10.1007/BF01931367

[^64]: WERBOS, Paul J. Beyond Regression: New Tools for Prediction and Analysis in the Behavioral Sciences. Tese (Doutorado), Harvard University, 1974.

[^65]: RUMELHART, D. E.; HINTON, G. E.; WILLIAMS, R. J. Learning Representations by Back-Propagating Errors. Nature, 323, p. 533–536, 1986. https://doi.org/10.1038/323533a0

[^66]: SCHMIDHUBER, Jürgen. Deep Learning in Neural Networks: An Overview. Neural Networks, 61, p. 85–117, 2015. https://doi.org/10.1016/j.neunet.2014.09.003

[^67]: FUKUSHIMA, Kunihiko. Neocognitron. Biological Cybernetics, 36(4), p. 193–202, 1980. https://doi.org/10.1007/BF00344251

[^68]: HOPFIELD, John J. Neural Networks and Physical Systems with Emergent Collective Computational Abilities. PNAS, 79(8), p. 2554–2558, 1982. https://doi.org/10.1073/pnas.79.8.2554

[^69]: LeCUN, Y. et al. Backpropagation Applied to Handwritten Zip Code Recognition. Neural Computation, 1(4), p. 541–551, 1989. https://doi.org/10.1162/neco.1989.1.4.541

[^70]: HOCHREITER, Sepp; SCHMIDHUBER, Jürgen. Long Short-Term Memory. Neural Computation, 9(8), p. 1735–1780, 1997. https://doi.org/10.1162/neco.1997.9.8.1735

[^71]: PEARL, Judea. Probabilistic Reasoning in Intelligent Systems. San Mateo, CA: Morgan Kaufmann, 1988.

[^72]: CORTES, Corinna; VAPNIK, Vladimir. Support-Vector Networks. Machine Learning, 20, p. 273–297, 1995. https://doi.org/10.1007/BF00994018

[^73]: CAMPBELL, M.; HOANE, A. J.; HSU, F. Deep Blue. Artificial Intelligence, 134(1–2), p. 57–83, 2002. https://doi.org/10.1016/S0004-3702(01)00129-1

[^74]: HINTON, G. E.; OSINDERO, S.; TEH, Y.-W. A Fast Learning Algorithm for Deep Belief Nets. Neural Computation, 18(7), p. 1527–1554, 2006. https://doi.org/10.1162/neco.2006.18.7.1527

[^75]: RAINA, R.; MADHAVAN, A.; NG, A. Y. Large-Scale Deep Unsupervised Learning Using Graphics Processors. ICML, 2009. https://doi.org/10.1145/1553374.1553486

[^76]: DENG, J. et al. ImageNet: A Large-Scale Hierarchical Image Database. CVPR, 2009. https://doi.org/10.1109/CVPR.2009.5206848

[^77]: KRIZHEVSKY, A.; SUTSKEVER, I.; HINTON, G. E. ImageNet Classification with Deep Convolutional Neural Networks. NeurIPS, 2012. Versão CACM (2017): https://doi.org/10.1145/3065386

[^78]: LeCUN, Y.; BENGIO, Y.; HINTON, G. Deep Learning. Nature, 521, p. 436–444, 2015. https://doi.org/10.1038/nature14539

[^79]: MIKOLOV, T. et al. Efficient Estimation of Word Representations in Vector Space. 2013. https://arxiv.org/abs/1301.3781

[^80]: BAHDANAU, D.; CHO, K.; BENGIO, Y. Neural Machine Translation by Jointly Learning to Align and Translate. 2014. https://arxiv.org/abs/1409.0473

[^81]: SILVER, D. et al. Mastering the Game of Go with Deep Neural Networks and Tree Search. Nature, 529, p. 484–489, 2016. https://doi.org/10.1038/nature16961

[^82]: ACM. Fathers of the Deep Learning Revolution Receive ACM A.M. Turing Award (2018). https://awards.acm.org/about/2018-turing

[^83]: VASWANI, A. et al. Attention Is All You Need. NeurIPS, 2017. https://arxiv.org/abs/1706.03762

[^84]: RADFORD, A. et al. Improving Language Understanding by Generative Pre-Training. OpenAI, 2018. https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf

[^85]: DEVLIN, J. et al. BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding. 2018. https://arxiv.org/abs/1810.04805

[^86]: KAPLAN, J. et al. Scaling Laws for Neural Language Models. 2020. https://arxiv.org/abs/2001.08361

[^87]: HOFFMANN, J. et al. Training Compute-Optimal Large Language Models. 2022. https://arxiv.org/abs/2203.15556

[^88]: BROWN, T. et al. Language Models are Few-Shot Learners. NeurIPS, 2020. https://arxiv.org/abs/2005.14165

[^89]: CHRISTIANO, P. et al. Deep Reinforcement Learning from Human Preferences. NeurIPS, 2017. https://arxiv.org/abs/1706.03741

[^90]: OUYANG, L. et al. Training Language Models to Follow Instructions with Human Feedback. 2022. https://arxiv.org/abs/2203.02155

[^91]: OPENAI. Introducing ChatGPT. 30 nov. 2022. https://openai.com/index/chatgpt/

[^92]: THE NOBEL PRIZE. The Nobel Prize in Physics 2024. https://www.nobelprize.org/prizes/physics/2024/summary/

[^93]: SUTTON, Richard S. The Bitter Lesson. 13 mar. 2019. http://www.incompleteideas.net/IncIdeas/BitterLesson.html

[^94]: UNIÃO EUROPEIA. Regulamento (UE) 2024/1689 (AI Act), arts. 50 e 51. https://eur-lex.europa.eu/eli/reg/2024/1689/oj

[^95]: ESTADOS UNIDOS. Executive Order 14110 (30 out. 2023), revogada pela Executive Order 14148 (20 jan. 2025). https://www.govinfo.gov/content/pkg/DCPD-202300949/pdf/DCPD-202300949.pdf

[^96]: CALIFÓRNIA. SB 1047 (2024) — Safe and Secure Innovation for Frontier Artificial Intelligence Models Act; vetado em set. 2024. https://leginfo.legislature.ca.gov/faces/billNavClient.xhtml?bill_id=202320240SB1047

[^97]: THE WASHINGTON POST. Trump rejeita pedidos para desacelerar a IA, citando competição chinesa. 13 set. 2026. https://www.washingtonpost.com/politics/2026/09/13/trump-rejects-calls-so-slow-ai-development-citing-chinese-competition/

[^98]: REUTERS. Negociadores do Senado dos EUA consideram exigir que empresas de IA mitiguem riscos conhecidos. 11 set. 2026. https://www.reuters.com/legal/litigation/us-senate-negotiators-consider-requiring-ai-firms-mitigate-known-major-risks-2026-09-11/

[^99]: ESTADOS UNIDOS. Atomic Energy Act of 1946 (Public Law 79-585).

[^100]: BERNSTEIN v. U.S. DEPARTMENT OF JUSTICE, 176 F.3d 1132 (9th Cir. 1999). Caso central da disputa sobre o controle de exportação de criptografia nos EUA.

[^101]: UNIÃO EUROPEIA. Regulamento (UE) 2024/1183 (eIDAS 2.0 — Carteira Europeia de Identidade Digital). https://eur-lex.europa.eu/eli/reg/2024/1183/oj

[^102]: TRIBUNAL SUPERIOR ELEITORAL. Por Dentro das Eleições: conheça as regras sobre uso de IA na campanha eleitoral de 2026 (Resolução nº 23.755/2026). Abr. 2026. https://www.tse.jus.br/comunicacao/noticias/2026/Abril/por-dentro-das-eleicoes-conheca-as-regras-sobre-uso-de-ia-na-campanha-eleitoral-de-2026

[^103]: CÂMARA DOS DEPUTADOS. PL 2338/2023 — ficha de tramitação e projetos apensados. https://www.camara.leg.br/proposicoesWeb/fichadetramitacao?idProposicao=2487262

[^104]: MOBILE TIME. Marco de IA ganha força para ser votado no final do ano. 24 ago. 2026. https://www.mobiletime.com.br/noticias/24/08/2026/marco-ia-voto-fim-do-ano/

[^105]: GARANTE PER LA PROTEZIONE DEI DATI PERSONALI (Itália). Limitação provisória do tratamento de dados pelo ChatGPT/OpenAI. 30 mar. 2023. https://www.garanteprivacy.it

[^106]: AUTORIDADE NACIONAL DE PROTEÇÃO DE DADOS (ANPD). Medida preventiva determinando à Meta a suspensão do uso de dados pessoais para treinamento de I.A. Jul. 2024. https://www.gov.br/anpd

[^107]: CNN BUSINESS. Musk's Grok blocked by Indonesia, Malaysia over sexualized images in world first. 12 jan. 2026. https://www.cnn.com/2026/01/12/business/indonesia-malaysia-grok-elon-musk-intl-hnk

[^108]: BRASIL. Constituição da República Federativa do Brasil de 1988, art. 223. https://www.planalto.gov.br/ccivil_03/constituicao/constituicao.htm

[^109]: DEEPSEEK-AI. DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning. 2025. https://arxiv.org/abs/2501.12948
