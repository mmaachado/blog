#!/usr/bin/env bash
# Build usado pela Vercel. Fixa a versão do Hugo para que a nuvem produza
# exatamente o mesmo site que a máquina local.
set -euo pipefail

# Versão única, compartilhada com a integração contínua.
HUGO_VERSION="$(tr -d '[:space:]' < .hugo-version)"

# O tema é um submodule. A Vercel resolve submodules públicos por HTTPS, mas
# garantir aqui transforma uma falha silenciosa em erro explícito.
if [ -d .git ]; then
  git submodule sync --recursive
  git submodule update --init --recursive
fi

if [ ! -f themes/poison/theme.toml ]; then
  echo "tema ausente em themes/poison: o submodule não foi inicializado" >&2
  exit 1
fi

curl -sSL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
  | tar -xz -C /tmp hugo

# O tema escreve <base href> com a URL absoluta do site, então todo caminho da
# página é resolvido contra o baseURL — CSS incluído. Um baseURL fixo faz o
# navegador buscar os arquivos em outro domínio, e a página abre sem estilo.
#
# Cada preview tem domínio próprio e a produção muda quando o domínio
# definitivo for apontado, então o valor vem do ambiente. Em produção,
# VERCEL_PROJECT_PRODUCTION_URL é o domínio customizado quando existe um, e o
# .vercel.app enquanto não existe: a virada de domínio se resolve sozinha.
dominio=""
case "${VERCEL_ENV:-}" in
  production)          dominio="${VERCEL_PROJECT_PRODUCTION_URL:-}" ;;
  preview|development) dominio="${VERCEL_URL:-}" ;;
esac

if [ -n "$dominio" ]; then
  echo "baseURL: https://${dominio}/"
  set -- --baseURL "https://${dominio}/"
fi

/tmp/hugo --gc --minify "$@"
