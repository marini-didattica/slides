# AGENTS.md
A collection of [Slidev](https://sli.dev) presentations (Slidev 53 + Vue 3) in
one repository.

## Structure
- Every deck lives in `src/<track>/<deck>/`, with `0-main.md` as its entry point.
  Tracks are `prime`, `seconde`, `olimpiadi` and `extra`.
- Keep files organized by topic or by single slides. Each slide/groups of slides
  should be under the deck folder.
- Try to stick to markdown syntax as much as possible. If a more involved Vue
  component is needed then ask before creating one. In general all slides should
  contain not much html and should be easily human readable.
- Use css root variables as much as possible; avoid using colors directly so
  that the whole presentation could be themed tweaking the main colors in the
  theme repo (`theme/styles/theme.css`).

## Theme & addon (separate repositories)

The deck consumes two sibling git repos, installed as npm git dependencies (see `package.json`). They are intentionally untracked here (`.gitignore`).

- `theme/` → `marini-slidev-theme` — all CSS + the global layers. Auto-loaded by Slidev:
  - `styles/index.ts` — imports the Slidev base layouts, the `baseline.css` inherited from `@slidev/theme-default`, the bundled fonts, then `theme.css`.
  - `styles/theme.css` — design tokens live in `:root` / `html.dark` (`--c-*`, `--slidev-theme-primary`). Helper classes: `.box`, `.badge` (+ `.badge-accent`, `.badge-round`), `.eyebrow`. Indented with tabs.
  - `global-top.vue` — persistent `topic:` kicker; `global-bottom.vue` — footer rendered on every slide (author + `page / total`).
- `addons/` → `marini-slidev-addons` — `components/*.vue` usable in slides with no import (e.g. `<Badge round>vs</Badge>`, `<Counter />`).

The deck opts in from headmatter: `theme: marini-slidev-theme` and `addons: [marini-slidev-addons]`. Slide content still auto-loads `snippets/` from this repo.

## Directives
- NEVER run chromium with shell to test; use chrome-devtools and attach to `http://localhost:3030`. The instance will be already running
- NEVER run shell tools like ls, grep and so on. You can use your integrated tools for that
- Try to stick to default markdown syntax as much as possible. Limit html and if something complicated is needed prompt the user before implementing it

##  tools
You should use mcp/builtin tools/plugins whenever possible, resorting to shell only when something that is not achievable with said tools is needed

### Mcp
- slidev: registers a `slidev` MCP server at `http://localhost:3030/__mcp`.
- code-graph: use to index and navigate codebase
- chrome-devtools: use to interact with the browser (e.g. read console logs). The application slides will be already running in `http://localhost:3030`. If thats not the case please let me know before proceeding
