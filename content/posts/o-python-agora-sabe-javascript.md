---
title: O Python agora sabe JavaScript
date: 2026-09-01T17:41:31-03:00
draft: true
description: Tudo o que já foi publicado, do mais recente ao mais antigo.
tags:
  - Python
  - engenharia-de-software
  - PEP
---
## Introdução

> TL;DR: Existe dentro do código fonte do **CPython** *(3.15 -> Improved error messages gh-146406)*, uma tabela com nomes de métodos em JavaScript, Java, Ruby e C#. E ela está lá para corrigir.

## Demonstração

```python
[1, 2, 3].push(4)
```

No 3.15 essa expressão retorna um belo `'list' object has no attribute 'push'. Did you mean '.append'?`. Da mesma forma que `'hello'.toUpperCase()` sugere `.upper`.

## Por que isso não é novo

Anteriormente, sugestões similares já existiam com o `AttributeError`, mas por [distância Levenshtein](https://pt.wikipedia.org/wiki/Dist%C3%A2ncia_Levenshtein), comparada contra os atributos que o objeto *realmente tem*. `push` não se parece com `append`, nem com `pop`, nem com nada em `list`. Levenshtein não tinha o que sugerir.

## A "solução"

Quando não há match próximo, o interpretador cai numa tabela estática de nomes comuns de outras linguagens e devolve o equivalente em Python.

### O caso que não é um método

`{}.put("a", 1)` -> a dica não sugere método nenhum, ela descreve a construção: `Use d[k] = v`. Porque em Python o equivalente não é uma chamada, é a própria sintaxe.

### O caso imutável

`(1, 2, 3).append(4)` -> `Did you mean to use a 'list' object?`. A dica identificou que o problema não é o nome, é o tipo!

## Camada de consequência

Mensagem de erro virou superfície de produto no CPython. Mas isso tem um preço explícito: é uma tabela mantida à mão, que precisa ser atualizada, e que só serve para quem chega de outra linguagem. 

O **core team** decidiu que esse público vale o custo de manutenção, a pergunta para deixar no ar: quantas linguagens fazem o caminho inverso e traduzem Python para você?

---
