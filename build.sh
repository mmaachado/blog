#!/usr/bin/env bash
# Build usado pela Vercel. Fixa a versão do Hugo para que a nuvem produza
# exatamente o mesmo site que a máquina local.
set -euo pipefail

HUGO_VERSION="0.165.0"

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

/tmp/hugo --gc --minify
