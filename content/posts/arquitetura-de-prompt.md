---
title: "Arquitetura De Prompt"
date: 2026-09-09T10:55:21-03:00
draft: true
description: ""
tags: []
# series: "Nome da série"   # descomente para incluir o post em uma série
---
## Introdução

Antigamente, metade do tempo gasto ao iniciar um projeto do zero era de planejar a arquitetura do software, criar as estruturas de diretórios, instalar as dependências, configurar o `black`, `pytest`, `taskpy`, `ruff` e afins no seu `pyproject.toml`, um bom desenvolvedor já tinha um draft dessas configurações e só fazia o ajuste fino para cada repositório. Hoje, mesmo com o avanço de LLM's de fronteira, um desenvolvedor pode gastar cerca de 70% do seu tempo apenas criando um `CLAUDE.md` e `.claude/` robustos na raíz do projeto.

O problema mudou de configurar o projeto na mão, pra configurar uma LLM que irá configurar o projeto. Se engana quem pensa que "é só botar a IA para criar as configurações e estruturas", um bom desenvolvedor sabe que não dá para confiar cegamente no que um modelo sugere, ainda mais no que diz em configurações do projeto.

##
