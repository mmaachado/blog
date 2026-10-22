# Política de segurança

Este repositório gera um site estático. Não há servidor, banco de dados nem login, e nenhum
dado de leitor fica guardado. Isso deixa pouca coisa para atacar, mas não deixa zero: o build
executa scripts, as páginas carregam recursos e uma configuração errada pode expor algo que
não deveria.

## O que reportar

- Um segredo ou credencial commitado por engano.
- Qualquer comprometimento da cadeia de build: o `build.sh`, o workflow do GitHub Actions, o
  submodule do tema ou qualquer outra coisa que rode durante o deploy.
- Conteúdo capaz de injetar script na página publicada.
- Uma configuração que exponha mais do que deveria.

## Como reportar

Use o [relato privado de vulnerabilidade](https://github.com/mmaachado/blog/security/advisories/new)
do GitHub, e não uma issue pública.

Mantenho o blog no meu tempo livre, então a resposta pode levar alguns dias.

## Versões

Só existe uma versão, a que está no ar. As correções entram em `master` e são publicadas logo
em seguida, e nenhuma versão antiga recebe suporte.
