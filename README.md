# Vaults of Parnassus

Meu blog pessoal. Escrevo os posts em Markdown, o [Hugo](https://gohugo.io/) gera o site com o
tema [Poison](https://github.com/lukeorth/poison) e a Vercel publica a cada push em `master`.

## Requisitos

- Hugo extended, 0.158 ou mais novo (uso a 0.165)
- Git

## Rodando localmente

O tema é um submodule, então o clone precisa do `--recurse-submodules`:

```sh
git clone --recurse-submodules https://github.com/mmaachado/blog.git
cd blog
hugo server -D
```

Se já clonou sem a flag:

```sh
git submodule update --init --recursive
```

O `-D` mostra os rascunhos localmente. No site publicado eles não aparecem.

## Criando um post

```sh
hugo new posts/nome-do-post.md                       # post de texto
hugo new --kind post-bundle posts/nome-do-post       # post com imagens
hugo new --kind page nome-da-pagina/_index.md        # página avulsa, fora do blog
```

Depois é escrever, preencher o `description` e trocar `draft: true` por `false`.

Um post com imagens é um diretório: o `index.md` e as imagens ao lado, referenciadas só pelo
nome do arquivo (`![legenda](imagem.jpg)`). Como texto e imagens ficam na mesma pasta, dá para
renomear ou arquivar o post sem quebrar nenhum link.

Antes de abrir o pull request, rode o build de produção e confira se ele sai limpo:

```sh
hugo --gc --minify
```

## Escrevendo no Obsidian

A pasta `08 Blog/` do vault aponta para `content/posts/`, via junction no Windows e symlink no
macOS/Linux. Os arquivos ficam no repositório e o Obsidian apenas os enxerga, então não existe
cópia nem sincronização para manter. Escrevo no Obsidian e faço o commit pelo repositório.

Para recriar o link em outra máquina, feche o Obsidian antes.

No Windows, use junction. Um symlink de diretório exige terminal elevado ou modo
desenvolvedor, e a junction não precisa de nenhum dos dois:

```powershell
$vault = "<caminho do vault>\08 Blog"
$alvo  = "<caminho do repositório>\content\posts"
Remove-Item -LiteralPath $vault -Recurse   # a pasta precisa não existir
New-Item -ItemType Junction -Path $vault -Target $alvo
```

No macOS/Linux essa restrição não existe, e um symlink comum resolve:

```sh
vault="<caminho do vault>/08 Blog"
alvo="<caminho do repositório>/content/posts"
rm -rf "$vault"   # a pasta precisa não existir
ln -s "$alvo" "$vault"
```

O Obsidian escreve algumas coisas que o Hugo não entende, e o `check.sh` cobre dois desses
casos. O primeiro é o front matter, que precisa ser YAML, não TOML. O segundo são
wikilinks (`[[nota]]`) e anexos embutidos (`![[imagem.png]]`), que não são Markdown: o Hugo
publica os colchetes como texto e a imagem simplesmente não aparece. Use link e imagem em
Markdown normal.

O template `99 Templates/Blog Template.md` do vault segue o mesmo formato do archetype de post.

## Verificações

```sh
./scripts/check.sh          # build de produção + front matter, rascunhos e links internos
npx markdownlint-cli2       # formatação do Markdown
```

O `check.sh` faz o próprio build em `.verify/` e ignora o `public/`. Um `public/` que sobrou do
`hugo server` tem rascunhos e o script de livereload, e com ele as verificações passariam ou
falhariam pelo motivo errado. O GitHub Actions roda esses mesmos dois comandos em todo pull
request.

## Deploy

A Vercel publica o site a cada push em `master`, e cada pull request ganha um preview com URL
própria.

O repositório começou no boilerplate de Hugo da Vercel, em que a plataforma construía o site
sem configuração nenhuma. Hoje o `vercel.json` aponta para o `build.sh`, que baixa a versão
exata do Hugo extended e inicializa o submodule do tema antes do build. Por isso a nuvem gera o
mesmo site que a minha máquina.

A versão do Hugo fica em `.hugo-version`, e tanto o `build.sh` quanto o workflow do Actions
leem dali. Para trocar de versão, edite esse arquivo e atualize o Hugo local junto.

O `baseURL` do build vem do ambiente, não do `hugo.toml`. Em produção ele é o domínio de
produção do projeto; em preview, o domínio daquele deploy. Isso importa porque o tema escreve
`<base href>` com a URL absoluta, e com um valor fixo o navegador buscaria CSS e imagens em
outro domínio, abrindo a página sem estilo. O `baseURL` do `hugo.toml` só vale para o build
local.

## Estrutura

| Caminho | O que é |
| --- | --- |
| `content/posts/` | os posts |
| `archetypes/` | modelos de front matter usados pelo `hugo new` |
| `layouts/` | só os templates que sobrescrevem os do tema |
| `assets/css/custom.css` | CSS próprio |
| `static/` | favicon e arquivos servidos sem processamento |
| `themes/poison/` | submodule; mudanças no tema vão para o fork, não para cá |
| `hugo.toml` | configuração do site |

## Licença

O código está sob [GPL-3.0](LICENSE), a mesma licença do tema. Quase todos os templates em
`layouts/` são cópias modificadas de arquivos do Poison, que é GPL-3.0, e usar uma licença só
no repositório inteiro evita a dúvida sobre qual vale para cada arquivo.

Os textos em `content/` estão sob
[Creative Commons BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt-br).
