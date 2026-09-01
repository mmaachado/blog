---
title: "Velocidade importa?"
date: 2025-07-21
lastmod: 2026-04-12
draft: false
description: "Python realmente é lento? Ou essa visão já foi rebatida?"
tags: ["python", "tech"]
---

## Introdução

> TL;DR: Python é mais lento que linguagens compiladas. Mas em 2025, essa diferença é irrelevante na prática.

Todo programador iniciante precisa escolher uma linguagem para começar. Apesar do discurso de que linguagem não importa _— e de que um bom profissional resolve problemas em qualquer stack —_, na prática, **é inviável** aprender múltiplas linguagens do zero ao mesmo tempo. A escolha inicial **direciona o estilo**, os **conceitos** e até o **tipo de projeto** que você vai construir.

Hoje, **JavaScript** é quase obrigatório. Mesmo para quem não trabalha com frontend, entender JS é útil para criar portfólios, manter sistemas legados ou lidar com stacks fullstack. Agora, para quem foca em backend, entra a segunda escolha: **PHP**, **Java**, **Python**, **Go**, etc. _— E sim, colocar JS no backend e no frontend ainda é uma ideia discutível_.

No meu caso, fui _“escolhido”_ pelo **Python**. Mas essa decisão sempre esbarrava em um comentário recorrente:

> **“Python** é lento. **Linguagem X** executa o mesmo código **10x** mais rápido.”

A frase é tecnicamente verdadeira, mas quase sempre descontextualizada. **Python** é _interpretado_, _dinamicamente tipado_ e possui limitações como o **GIL**[^1]. Mas, com o hardware atual e o tipo de aplicações modernas, essa _“lentidão”_ realmente importa?

## Por que Python é mais lento?

## 1. Execução interpretada

**Python** _— especificamente o CPython —_ é interpretado. Isso significa que o código é lido e executado **linha por linha**, em tempo real. Já linguagens como **C++** ou **Rust** são compiladas para código nativo antes da execução, o que elimina o _overhead_ de interpretação e gera _binários otimizados_.

## 2. Tipagem dinâmica

Em **Python**, uma variável pode ser um `int` em uma linha e um `str` na próxima. Isso exige verificações constantes em tempo de execução. Linguagens de tipagem estática _— C++ e Java —_ resolvem isso em tempo de compilação. Tipar variáveis com _type hints_ reduz esse _overhead_ e melhora ferramentas de análise estática.

## GIL (Global Interpreter Lock)

O **GIL** impede que múltiplas _threads_ executem _bytecode_ **Python** simultaneamente. Isso limita o paralelismo em tarefas _CPU-bound_, mesmo em máquinas com múltiplos núcleos. Ele existe por motivos históricos _— simplificar o gerenciamento de memória —_, mas vem sendo substituído gradualmente. A partir do **Python 3.14**, o **GIL** será desativável experimentalmente.

## Benchmarks: Python é de fato mais lento

No [**The Computer Language Benchmarks Game**](https://benchmarksgame-team.pages.debian.net/benchmarksgame/fastest/python3-gpp.html), tarefas como `n-body` e `fasta` são de **10x** a **100x** mais rápidas em linguagens compiladas. Isso acontece porque:

- São algoritmos puramente computacionais.
- Usam apenas Python puro (sem C extensions).

Ou seja: **é o pior cenário possível para o Python**. Não representa o uso real em aplicações modernas, que envolvem _I/O_, _redes_, _banco de dados_ e _bibliotecas externas_.

## Faster CPython: performance real evoluindo

Desde o **Python 3.11**, há um projeto ativo para otimizar o interpretador padrão:

- **Python 3.11**: ~25% mais rápido que o 3.10.
- **Python 3.12**: mais 5% de ganho.
- **Python 3.13/3.14**: foco em JIT (Just-in-Time Compiler), desativação do GIL e otimizações em bytecode.

Essas melhorias são tangíveis. Foram implementadas otimizações como _caching adaptativo_, especialização de _bytecode_ e coleta de métricas em tempo real para melhorar o desempenho do interpretador.

### Referências

- [PEP 659 - Specializing Adaptive Interpreter](https://peps.python.org/pep-0659/);
- [PEP 703 - Making the GIL optional](https://peps.python.org/pep-0703/);
- [Faster CPython Project](https://docs.python.org/3/whatsnew/3.11.html#faster-cpython);

## Em 2025, a "lentidão" importa?

> Na maioria dos casos, não.

## 1. A maioria das aplicações são I/O-bound

Aplicações web e sistemas distribuídos passam mais tempo esperando do que computando. Espera por _rede_, _banco de dados_, _leitura de disco_, etc. Nessas situações, linguagens com bom suporte a **concorrência assíncrona** têm vantagem.

**Python tem isso**. `asyncio`, `FastAPI`, `aiohttp`, `uvicorn` e outros frameworks exploram bem a natureza assíncrona do **Python**.

## 2. Custo de desenvolvimento supera custo de execução

Tempo de entrega, clareza de código, facilidade de manutenção e curva de aprendizado importam mais. Um **backend** em `Flask` ou `FastAPI` pode ser entregue em dias. Reescrever isso em **C++** pode levar semanas. A diferença de custo/hora do desenvolvedor é mais relevante do que o uso de _CPU_.

## 3. Python não faz tudo sozinho (nem precisa)

Quando a performance realmente importa _— ciência de dados, machine learning, análise numérica —_ o trabalho pesado é feito por **C**, **C++** ou **Fortran** via _bindings_. `NumPy`, `Pandas`, `TensorFlow`, `scikit-learn`, `OpenCV` e `PyTorch` são _wrappers_ **Python** sobre código nativo otimizado.

Você orquestra em **Python**. O processamento acontece fora do interpretador.

## Conclusão

Sim, **Python** é mais lento. Sim, há casos em que isso importa.

Mas **na maioria dos projetos reais**, a performance bruta do interpretador é irrelevante. O diferencial do **Python** é _produtividade_, _legibilidade_ e um _ecossistema maduro_ com soluções prontas para quase qualquer tipo de problema.

> Criticar o **Python** por ser _“lento”_ em 2025 é como reclamar que um ônibus não corre como um **Porsche 911 GT3RS**. Não é o propósito dele _— mas ele entrega muita gente, com segurança, eficiência e previsibilidade_.

[^1]: Versões mais atuais nem possuem mais esse bloqueio, vide [PEP 703](https://peps.python.org/pep-0703/).
