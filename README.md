# Tempify Templates

Collection of [Tempify](https://github.com/Coditary/Tempify) templates.

## Templates

| Template | Purpose |
|----------|---------|
| `tempify-tpl` | Minimal scaffold for authoring a new Tempify template |
| `tempify-tpl-project` | Full template-authoring project: checks, snapshot tests, and registry publish automation (Beez or Makefile) |

## Usage

Templates can be referenced by path — no installation needed:

```bash
# Scaffold a minimal new template
tempify ./tempify-tpl my-new-template

# Scaffold a template project with build automation (Beez by default)
tempify ./tempify-tpl-project my-new-template

# Same, but with a Makefile instead of build.lua
tempify ./tempify-tpl-project my-new-template --set build_system=make
```

## Developing templates here

Each template ships fixtures under `tests/<fixture>/`:

```bash
tempify validate ./tempify-tpl-project
tempify lint ./tempify-tpl-project
tempify test ./tempify-tpl-project
tempify test ./tempify-tpl-project --update-snapshots   # after intentional changes
```

## Registry

Catalog and submission workflow live in [`tempify-registry/`](tempify-registry/) (remote: [Coditary/tempify-registry](https://github.com/Coditary/tempify-registry)).

- `registry/<letter>/<id>.json` — one entry per template (rqp-registry style)
- `templates.json` — aggregated catalog fetched by the Tempify plugin
- `scripts/build-catalog.sh` — rebuild `templates.json` after entry changes

Projects generated from `tempify-tpl-project` ship `beez publish` / `make publish`, which re-runs checks + tests and opens a registration issue in `Coditary/tempify-registry` via the GitHub CLI.
