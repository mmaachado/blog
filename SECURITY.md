# Política de segurança

Este repositório gera um site estático: não há servidor, banco de dados, autenticação nem
dados de leitores armazenados. A superfície de ataque é pequena, mas não é nula — o build
executa scripts, o site carrega recursos e a configuração pode vazar algo que não deveria.

## O que reportar

- Segredo ou credencial commitado por engano.
- Comprometimento da cadeia de build: `build.sh`, o workflow do GitHub Actions, o submodule do
  tema ou qualquer coisa que execute durante o deploy.
- Conteúdo capaz de injetar script na página publicada.
- Configuração que exponha mais do que deveria.

## Como reportar

Use o [relato privado de vulnerabilidade](https://github.com/mmaachado/blog/security/advisories/new)
do GitHub. Não abra issue pública para falha de segurança.

Este é um blog pessoal, mantido no tempo livre: a resposta pode levar alguns dias.

## Versões

Só existe uma versão, a que está publicada. Correções vão para `master` e são publicadas na
sequência; não há releases anteriores recebendo suporte.
