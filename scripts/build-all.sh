#!/usr/bin/env bash
set -euo pipefail

# Build every deck under src/<track>/<deck>/ into dist/<track>/<deck>/.
# Each deck is served from its own base path so one Cloudflare Pages project can
# host all of them.

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

entries="$(find src -name '0-main.md' | sort)"

if [ -z "$entries" ]; then
  echo "No entry points (src/**/0-main.md) found" >&2
  exit 1
fi

rm -rf dist

for entry in $entries; do
  rel="${entry#src/}"
  rel="${rel%/0-main.md}"

  echo "Building $entry -> /$rel/"
  npx slidev build "$entry" \
    --without-notes \
    --base "/$rel/" \
    --router-mode hash \
    --out "$root/dist/$rel"
done

# Minimal landing page for the project root.
{
  echo '<!doctype html>'
  echo '<html lang="it">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
  echo '<title>Slide — Marini didattica</title>'
  echo '<style>'
  echo 'body{font-family:system-ui,sans-serif;max-width:48rem;margin:4rem auto;padding:0 1.5rem;line-height:1.6}'
  echo 'h1{font-size:1.75rem}ul{padding-left:1.25rem}li{margin:.35rem 0}'
  echo 'a{color:#2563eb}'
  echo '</style>'
  echo '</head>'
  echo '<body>'
  echo '<h1>Slide — Marini didattica</h1>'
  echo '<ul>'

  for entry in $entries; do
    rel="${entry#src/}"
    rel="${rel%/0-main.md}"
    echo "<li><a href=\"/$rel/\">$rel</a></li>"
  done

  echo '</ul>'
  echo '</body>'
  echo '</html>'
} > "$root/dist/index.html"

echo "Built $(printf '%s\n' "$entries" | wc -l) deck(s) in dist/."
