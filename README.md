# Slides — Marini didattica

All the [Slidev](https://sli.dev) decks of the didactic site in one repository.
The previous `slide-prime`, `slide-olimpiadi` and `slide-extra` repositories were
merged here and no longer deploy.

## Decks

| Track | Deck | Path |
|---|---|---|
| Prime | Introduzione python | `src/prime/1-introduzione-python/0-main.md` |
| Prime | Esercizi python | `src/prime/2-esercizi-python/0-main.md` |
| Seconde | Ripasso Python | `src/seconde/1-introduzione-python/0-main.md` |
| Seconde | Esercizi Python | `src/seconde/2-esercizi-python/0-main.md` |
| Olimpiadi | Programmazione dinamica | `src/olimpiadi/1-programmazione-dinamica/0-main.md` |
| Olimpiadi | Soluzioni problemi OII | `src/olimpiadi/2-soluzioni-problemi-oii/0-main.md` |
| Extra | Uso vscode.dev | `src/extra/vscode-web/0-main.md` |

Each deck lives in `src/<track>/<deck>/`. The build keeps the same structure in
`dist/`, so the deployed URL is `/<track>/<deck>/`.

## Development

```sh
bun install
bun run dev src/prime/1-introduzione-python/0-main.md
```

`bun run dev` starts Slidev on <http://localhost:3030>. Pass the entry point of
the deck you want to edit, as shown above.

The theme and addons are installed as git dependencies from
`github.com/russell-informatica/slidev-theme` and
`github.com/russell-informatica/slidev-addons` (see `package.json`).

## Build

```sh
bun run build:all
```

The script (`scripts/build-all.sh`) finds every `src/**/0-main.md`, builds it
with `--base "/<track>/<deck>/"` and writes the result to
`dist/<track>/<deck>/`. It also writes a small `dist/index.html` landing page.

## Deploy

Every push to `main` runs `.github/workflows/deploy.yml`, which builds all decks
and deploys `dist/` to the Cloudflare Pages project `marini-didattica-slides`:

<https://marini-didattica-slides.pages.dev/>

The repository needs the `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID`
secrets. See `../CLOUDFLARE.md` for the account setup.
