# Como contribuir

Este é um blog pessoal. O conteúdo é escrito por uma pessoa só, e não há intenção de aceitar
posts de terceiros — mas correções e melhorias no site são bem-vindas.

## Corrigindo um post

Erro de digitação, link quebrado, informação desatualizada ou trecho de código que não roda:
abra uma issue de **Defeito** apontando a página, ou mande um pull request direto.

Cada post é um arquivo em `content/posts/`. O caminho segue a URL: `/posts/velocidade-importa/`
vive em `content/posts/velocidade-importa.md`.

O que muda o texto e o que muda o sentido são coisas diferentes. Correção objetiva — grafia,
sintaxe, um número errado — entra direto. Discordância sobre o conteúdo é assunto de issue,
não de pull request: a opinião do post é de quem assina.

## Mexendo no site

```sh
git clone --recurse-submodules https://github.com/mmaachado/blog.git
cd blog
hugo server -D
```

Antes de abrir o pull request:

```sh
./scripts/check.sh
npx markdownlint-cli2
```

As mesmas verificações rodam no GitHub Actions e precisam passar para o merge acontecer.

Duas regras que economizam revisão:

- **Nada dentro de `themes/` é editado.** O tema é um submodule e precisa continuar
  atualizável. Para mudar um template, copie o arquivo para `layouts/` na raiz e edite lá — o
  Hugo dá precedência ao projeto sobre o tema.
- **Post publicado não muda de nome.** O nome do arquivo é a URL. Se renomear for necessário,
  registre a URL antiga em `aliases` no front matter.

O restante das convenções — front matter obrigatório, taxonomia, imagens em page bundle — está
no `README.md`.

## Licença

Contribuições de código entram sob GPL-3.0, a mesma licença do repositório. Os textos em
`content/` seguem CC BY-NC-SA 4.0.
