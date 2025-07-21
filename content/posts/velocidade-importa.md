+++
date = '2025-07-21T09:36:37-03:00'
draft = false
title = 'Velocidade Importa?'
tags = ['Python', 'Tech']
+++

> **TL;DR**: Python é mais lento que linguagens compiladas. Mas em 2025, essa diferença ainda é relevante na prática?

Todo programador iniciante precisa escolher uma linguagem para começar. Apesar do discurso de que linguagem não importa --- _e de que um bom profissional resolve problemas em qualquer stack_ ---, na prática, é inviável aprender múltiplas linguagens do zero ao mesmo tempo. A escolha inicial direciona o estilo, os conceitos e até o tipo de projeto que você vai construir.

Hoje, **JavaScript** é quase obrigatório. Mesmo para quem não trabalha com frontend, entender JS é útil para criar portfólios, manter sistemas legados ou lidar com stacks fullstack. Agora, para quem foca em backend, entra a segunda escolha: **PHP**, **Java**, **Python**, **Go**, etc. --- _E sim, colocar JS no backend **e** no frontend ainda é uma ideia discutível._

No meu caso, fui “escolhido” pelo Python. Mas essa decisão sempre esbarrava em um comentário recorrente:

> “Python é lento. Linguagem X executa o mesmo código 10x mais rápido.”

A frase é tecnicamente verdadeira, mas quase sempre descontextualizada. Python é interpretado, dinamicamente tipado e possui limitações como o GIL. Mas, com o hardware atual e o tipo de aplicações modernas, essa "lentidão" realmente importa?

## Por que Python é mais lento?

### 1. Execução interpretada

Python --- _especificamente o CPython_ --- é interpretado. Isso significa que o código é lido e executado linha por linha, em tempo real. Já linguagens como **C++** ou **Rust** são compiladas para código nativo antes da execução, o que elimina o overhead de interpretação e gera binários otimizados.

### 2. Tipagem dinâmica

Em Python, uma variável pode ser um `int` em uma linha e um `str` na próxima. Isso exige verificações constantes em tempo de execução. Linguagens de tipagem estática --- _C++ e Java_ --- resolvem isso em tempo de compilação. Tipar variáveis com `type hints` reduz esse overhead e melhora ferramentas de análise estática.

### 3. GIL (Global Interpreter Lock)

O GIL impede que múltiplas threads executem bytecode Python simultaneamente. Isso limita o paralelismo em tarefas CPU-bound, mesmo em máquinas com múltiplos núcleos. Ele existe por motivos históricos --- _simplificar o gerenciamento de memória_ ---, mas vem sendo substituído gradualmente. A partir do **Python 3.14**, o GIL será desativável experimentalmente.

## Benchmarks: Python é de fato mais lento

No [**The Computer Language Benchmarks Game**](https://benchmarksgame-team.pages.debian.net/benchmarksgame/fastest/python3-gpp.html), tarefas como `n-body` e `fasta` são de **10x a 100x** mais rápidas em linguagens compiladas. Isso acontece porque:

- São algoritmos puramente computacionais.
- Usam apenas Python puro (sem C extensions).

Ou seja: é o pior cenário possível para o Python. Não representa o uso real em aplicações modernas, que envolvem I/O, redes, banco de dados e bibliotecas externas.

## Faster CPython: performance real evoluindo

Desde o Python 3.11, há um projeto ativo para otimizar o interpretador padrão:

- **Python 3.11**: \~25% mais rápido que o 3.10.
- **Python 3.12**: mais 5% de ganho.
- **Python 3.13/3.14**: foco em JIT (Just-in-Time Compiler), desativação do GIL e otimizações em bytecode.

Essas melhorias são tangíveis. Foram implementadas otimizações como **caching adaptativo**, especialização de bytecode e coleta de métricas em tempo real para melhorar o desempenho do interpretador.

**Referências**:

- [PEP 659 - Specializing Adaptive Interpreter](https://peps.python.org/pep-0659/)
- [PEP 703 - Making the GIL Optional](https://peps.python.org/pep-0703/)
- [Faster CPython Project](https://docs.python.org/3/whatsnew/3.11.html#faster-cpython)

## Em 2025, a "lentidão" importa?

> **Não, na maioria dos casos.**

### 1. A maioria das aplicações são I/O-bound

Aplicações web e sistemas distribuídos passam mais tempo esperando do que computando. Espera por rede, banco de dados, leitura de disco, etc. Nessas situações, linguagens com bom suporte a concorrência assíncrona têm vantagem.

**Python tem isso.**
`asyncio`, `FastAPI`, `aiohttp`, `uvicorn` e outros frameworks exploram bem a natureza assíncrona do Python.

### 2. Custo de desenvolvimento supera custo de execução

Tempo de entrega, clareza de código, facilidade de manutenção e curva de aprendizado importam mais. Um backend em **Flask** ou **FastAPI** pode ser entregue em dias. Reescrever isso em _C++_ pode levar semanas. A diferença de custo/hora do desenvolvedor é mais relevante do que o uso de CPU.

### 3. Python não faz tudo sozinho (nem precisa)

Quando a performance realmente importa --- ciência de dados, machine learning, análise numérica --- o trabalho pesado é feito por _C_, _C++_ ou _Fortran_ via bindings. `NumPy`, `Pandas`, `TensorFlow`, `scikit-learn`, `OpenCV` e `PyTorch` são wrappers Python sobre código nativo otimizado.

Você orquestra em Python. O processamento acontece fora do interpretador.

## Conclusão

Sim, Python é mais lento.
Sim, há casos em que isso importa.

Mas **na maioria dos projetos reais**, a performance bruta do interpretador é irrelevante. O diferencial do Python é produtividade, legibilidade e um ecossistema maduro com soluções prontas para quase qualquer tipo de problema.

> Criticar o Python por ser “lento” em 2025 é como reclamar que um ônibus não corre como um Porsche 911 GT3RS. Não é o propósito dele --- _mas ele entrega muita gente, com segurança, eficiência e previsibilidade_.
