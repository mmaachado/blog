#!/usr/bin/env bash
# Verifica o site como ele sai em produção.
#
# Constrói sozinho, em um diretório próprio, em vez de olhar para public/: um
# public/ deixado por `hugo server` traz rascunhos e livereload, e as
# verificações passariam ou falhariam pelo motivo errado.
set -uo pipefail

saida=".verify"
falhas=0
# Incrementa, não atribui: cada seção compara o contador com o valor de antes
# dela para decidir se imprime "ok", e um valor fixo tornaria essa comparação
# verdadeira para sempre depois da primeira falha.
erro() { printf '  x %s\n' "$1"; falhas=$((falhas + 1)); }
titulo() { printf '\n%s\n' "$1"; }

trap 'rm -rf "$saida"' EXIT

# ------------------------------------------------------------------ build
titulo "Build de produção sem avisos"
rm -rf "$saida"
if ! log=$(hugo --gc --minify --panicOnWarning --destination "$saida" 2>&1); then
  echo "$log" | sed 's/^/  /'
  erro "o build falhou"
  printf '\nReprovado.\n'
  exit 1
fi
echo "  ok"

# ---------------------------------------------------------- front matter
titulo "Front matter obrigatório"
antes=$falhas
while IFS= read -r f; do
  grep -q '^draft: true' "$f" && continue
  for campo in title date description; do
    grep -qE "^${campo}: *\"?[^\"[:space:]]" "$f" || erro "$f: $campo ausente ou vazio"
  done
done < <(find content -name '*.md' ! -name '_index.md')
[ "$falhas" -eq "$antes" ] && echo "  ok"

# ------------------------------------------- front matter no formato do projeto
titulo "Front matter em YAML"
antes=$falhas
while IFS= read -r f; do
  head -1 "$f" | grep -q '^+++' && erro "$f: front matter em TOML; o padrão do projeto é YAML"
done < <(find content -name '*.md')
[ "$falhas" -eq "$antes" ] && echo "  ok"

# ------------------------------------------------- resíduo de editor no texto
# Wikilinks e anexos embutidos do Obsidian não são Markdown: o Hugo publica os
# colchetes como texto e a imagem simplesmente não aparece.
titulo "Sem sintaxe de Obsidian no conteúdo"
ocorrencias=$(grep -rnE '!?\[\[[^]]+\]\]' content --include='*.md' || true)
if [ -n "$ocorrencias" ]; then
  while IFS= read -r linha; do erro "$linha"; done <<< "$ocorrencias"
else
  echo "  ok"
fi

# ------------------------------------------------------------- rascunhos
titulo "Rascunhos fora da saída"
antes=$falhas
while IFS= read -r f; do
  grep -q '^draft: true' "$f" || continue
  slug=$(basename "${f%.md}")
  [ -e "$saida/posts/$slug/index.html" ] && erro "rascunho publicado: $slug"
done < <(find content/posts -name '*.md' ! -name '_index.md')
[ "$falhas" -eq "$antes" ] && echo "  ok"

# --------------------------------------------------------- links internos
titulo "Links internos"
quebrados=$(
  while IFS= read -r pagina; do
    grep -oE '(href|src)=("[^"]*"|[^ >]+)' "$pagina" \
      | sed -e 's/^[a-z]*=//' -e 's/^"//' -e 's/"$//' \
      | while IFS= read -r alvo; do
          case "$alvo" in
            ''|'#'*|http*|mailto:*|data:*|//*) continue ;;
            # Rotas servidas pela plataforma, não pelo build: não existem em disco.
            /_vercel/*) continue ;;
            /*) ;;
            *) continue ;;
          esac
          alvo=${alvo%%#*}; alvo=${alvo%%\?*}
          [ -z "$alvo" ] && continue
          destino="$saida$alvo"
          [ -f "$destino" ] && continue
          [ -f "${destino%/}/index.html" ] && continue
          printf '%s -> %s\n' "${pagina#$saida}" "$alvo"
        done
  done < <(find "$saida" -name '*.html') | sort -u
)

if [ -n "$quebrados" ]; then
  while IFS= read -r linha; do erro "$linha"; done <<< "$quebrados"
else
  echo "  ok"
fi

# ------------------------------------------------------------- resultado
if [ "$falhas" -ne 0 ]; then
  printf '\nReprovado.\n'
  exit 1
fi
printf '\nTudo certo.\n'
