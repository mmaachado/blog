# Como contribuir

Este é um blog pessoal e todos os posts são meus, então não aceito posts de terceiros.
Correções e melhorias no site, por outro lado, são bem-vindas.

## Corrigindo um post

Achou um erro de digitação, um link quebrado, uma informação desatualizada ou um trecho de
código que não roda? Abra uma issue de Defeito com o endereço da página, ou mande um pull
request direto.

Cada post é um arquivo em `content/posts/` com o mesmo nome da URL: `/posts/velocidade-importa/`
está em `content/posts/velocidade-importa.md`. Um post com imagens é um diretório com esse
nome e um `index.md` dentro.

Correção objetiva, como grafia, sintaxe ou um número errado, pode vir direto em pull request.
Se você discorda do conteúdo, abra uma issue: o post diz o que eu penso, e mudar isso começa
por uma conversa.

## Mexendo no site

```sh
git clone --recurse-submodules https://github.com/mmaachado/blog.git
cd blog
hugo server -D
```

Antes de abrir o pull request, rode as verificações:

```sh
./scripts/check.sh
npx markdownlint-cli2
```

O GitHub Actions roda as mesmas duas, e o merge só acontece se elas passarem.

Duas regras poupam idas e vindas na revisão:

- Não edite nada dentro de `themes/`. O tema é um submodule e precisa continuar atualizável.
  Para mudar um template, copie o arquivo para `layouts/` na raiz e edite a cópia, que o Hugo
  usa no lugar da versão do tema.
- Não renomeie um post publicado, porque o nome do arquivo é a URL. Se a troca for
  inevitável, coloque a URL antiga em `aliases` no front matter.

Os campos de front matter de cada tipo de conteúdo, `tags` e `series` incluídos, estão nos
modelos em `archetypes/`. O `README.md` explica como criar um post e onde ficam as imagens.

## Licença

Contribuições de código entram sob GPL-3.0, a mesma licença do repositório. Contribuições aos
textos em `content/` entram sob CC BY-NC-SA 4.0.
