# Sample Template

Sample template generated for the fixture

Template-authoring project generated with Tempify `tempify-tpl-project`.

## Layout

```text
template.lua      Template manifest — edit id/name/version here
questions.lua     Interactive questions of your template
files/            Template sources (`.pbt` files are rendered, the rest is copied)
tests/            Snapshot fixtures for `tempify test`
build.lua         Beez automation (this project)
scripts/publish.sh  Opens a registry issue in Coditary/tempify-registry
```

## Standard run

Validate + lint + snapshot tests in one go:

```bash
beez all
```

## Test

```bash
beez test                      # run snapshot fixtures
beez -s update-snapshots       # regenerate snapshots after intentional changes
```

Fixtures live in `tests/<name>/` with `answers.json` (input) and `snapshot/` (expected output).

## Publish

When the template is finished, request its registry entry:

```bash
beez publish
```

This re-runs checks + tests and then opens a registration issue in
[Coditary/tempify-registry](https://github.com/Coditary/tempify-registry) via the GitHub CLI (`gh`).

- Preview without creating anything: `PUBLISH_DRY_RUN=1 sh scripts/publish.sh`
- Override the target repo: `REGISTRY_REPO=owner/repo sh scripts/publish.sh`
- Without `gh` (or without auth), the script prints title + body so you can open the issue manually.

## Author

Tempify

