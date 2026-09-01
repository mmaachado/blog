---
title: "Hello World"
date: 2026-04-12
draft: true
description: "Post de referência para Markdown, KaTeX e code blocks."
tags: ["referencia", "markdown", "latex", "code"]
---

Este post serve como referência rápida de **formatação**, _estilos_ e exemplos de **KaTeX** e _code blocks_.

## Texto e estrutura

### Ênfase

- **Negrito**
- _Itálico_
- **_Negrito + itálico_**
- ~~Riscado~~
- `inline code`

### Links

- [Vaults of Parnassus](https://vaults-of-parnassus.vercel.app)
- Email: [contato@vaultsofparnassus.com](mailto:contato@vaultsofparnassus.com)

### Listas

Lista não ordenada:

- Item A
- Item B
- Item C

Lista ordenada:

1. Primeiro
2. Segundo
3. Terceiro

Checklist:

- [x] Escrever conteúdo
- [ ] Revisar
- [ ] Publicar

### Citação

> A simplicidade é o último grau de sofisticação.

### Tabela (GFM)

| Tipo   | Exemplo                    | Observação |
| ------ | -------------------------- | ---------- |
| Texto  | **negrito**                | destaque   |
| Código | `const x = 1`              | inline     |
| Link   | [docs](https://nextjs.org) | externo    |

### Imagem

![Avatar do blog](/avatar.png)

## Código

### JavaScript/TypeScript

```ts
type User = {
  id: string;
  email: string;
};

const getUser = async (id: string): Promise<User> => {
  return { id, email: "user@exemplo.com" };
};

console.log(await getUser("1"));
```

### Bash

```bash
pnpm install
pnpm dev
```

### JSON

```json
{
  "name": "vaults-of-parnassus",
  "status": "published",
  "tags": ["markdown", "latex", "code"]
}
```

## KaTeX (LaTeX)

Inline: $e^{i\pi} + 1 = 0$

Bloco:

$$
\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
$$

Matriz:

$$
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6
\end{bmatrix}
$$

Equação numerada (usando alinhamento):

$$
\begin{aligned}
a^2 + b^2 &= c^2 \\
F &= m \cdot a
\end{aligned}
$$

## Notas de rodapé

Texto com referência[^1].

[^1]: Exemplo de nota de rodapé.
