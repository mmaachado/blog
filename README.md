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
hugo new posts/nome-do-post.md                       # post de texto
hugo new --kind post-bundle posts/nome-do-post       # post com imagens
hugo new --kind page nome-da-pagina/_index.md        # página avulsa, fora do blog
```

Escreva, preencha `description` e troque `draft: true` para `false`.

Um post com imagens é um diretório com `index.md` e as imagens ao lado, referenciadas pelo nome
do arquivo (`![legenda](imagem.jpg)`). Texto e mídia andam juntos: renomear ou arquivar o post
não quebra nada.

Antes de abrir o pull request, confirme que o build de produção está limpo:

```sh
hugo --gc --minify
```

## Verificações

```sh
./scripts/check.sh          # build de produção + front matter, rascunhos e links internos
npx markdownlint-cli2       # formatação do Markdown
```

O `check.sh` constrói sozinho, em `.verify/`, em vez de olhar para `public/`: um `public/`
deixado por `hugo server` contém rascunhos e livereload, e as verificações passariam ou
falhariam pelo motivo errado. As mesmas duas linhas rodam no GitHub Actions a cada pull
request.

## Deploy

O site é publicado na Vercel a cada push em `master`; pull requests geram um preview com URL
própria.

O repositório nasceu do boilerplate de Hugo da Vercel, onde a plataforma construía o site sem
configuração nenhuma. Não é mais assim: `vercel.json` aponta para `build.sh`, que
baixa a versão exata do Hugo extended e garante que o submodule do tema esteja inicializado.
É isso que faz a nuvem produzir o mesmo site que a máquina local.

A versão fica em `.hugo-version`, lida tanto pelo `build.sh` quanto pelo workflow do Actions.
Para trocar, altere esse arquivo e atualize a máquina local junto.

O `baseURL` do build sai do ambiente, não do `hugo.toml`: em produção vem do domínio de
produção do projeto, em preview vem do domínio daquele deploy. O tema escreve `<base href>`
com a URL absoluta, então um valor fixo faria o navegador procurar CSS e imagens em outro
domínio — a página abriria sem estilo. O `baseURL` do `hugo.toml` vale para build local.

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

O código está sob [GPL-3.0](LICENSE). A escolha acompanha o tema: quatro templates em
`layouts/` são cópias modificadas de arquivos do Poison, que é GPL-3.0, e adotar a mesma
licença no repositório inteiro evita a ambiguidade de misturar as duas.

Os textos em `content/` estão sob
[Creative Commons BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt-br).
