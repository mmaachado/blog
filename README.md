# Vaults of Parnassus

Blog pessoal, escrito em Markdown e gerado por [Hugo](https://gohugo.io/) com o tema
[Poison](https://github.com/lukeorth/poison). Publicado no Vercel a cada push em `master`.

## Requisitos

- Hugo **extended** 0.158 ou superior (desenvolvido na 0.165)
- Git

## Como rodar

O tema é um submodule, então o clone precisa trazê-lo junto:

```sh
git clone --recurse-submodules https://github.com/mmaachado/blog.git
cd blog
hugo server -D
```

Se você já clonou sem o flag:

```sh
git submodule update --init --recursive
```

O `-D` inclui os rascunhos, que ficam de fora do site publicado.

## Como publicar

```sh
hugo new posts/nome-do-post.md
```

Escreva, preencha `description` e troque `draft: true` para `false`. Um post com imagens vira
um diretório com `index.md` e as imagens ao lado, para que texto e mídia andem juntos.

Antes de abrir o pull request, confirme que o build de produção está limpo:

```sh
hugo --gc --minify
```

## Estrutura

| Caminho | O que é |
| --- | --- |
| `content/posts/` | as publicações |
| `archetypes/` | modelos de front matter usados pelo `hugo new` |
| `layouts/` | apenas os templates que sobrescrevem o tema |
| `assets/css/custom.css` | CSS próprio |
| `static/` | favicon e arquivos servidos como estão |
| `themes/poison/` | submodule; nunca editado diretamente |
| `hugo.toml` | configuração do site |

## Licença

A definir: a intenção é uma licença permissiva para o código e uma nota de direitos autorais
separada para os textos em `content/`. O tema, distribuído como submodule, é GPL-3.0 do autor
original.
