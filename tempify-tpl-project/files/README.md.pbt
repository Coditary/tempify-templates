# {{ template_name }}

{{ template_description }}

Template-authoring project generated with Tempify `tempify-tpl-project`.

## Layout

```text
template.lua      Template manifest — edit id/name/version here
questions.lua     Interactive questions of your template
files/            Template sources (`.pbt` files are rendered, the rest is copied)
tests/            Snapshot fixtures for `tempify test`
{{ if build_system == "beez" }}build.lua         Beez automation (this project){{ else }}Makefile          Make automation (this project){{ endif }}
scripts/publish.sh  Opens a registry issue in {{ registry_repo }}
```

## Standard run

Validate + lint + snapshot tests in one go:

{{ if build_system == "beez" }}```bash
beez all
```{{ else }}```bash
make
```{{ endif }}

## Test

{{ if build_system == "beez" }}```bash
beez test                      # run snapshot fixtures
beez -s update-snapshots       # regenerate snapshots after intentional changes
```{{ else }}```bash
make test                      # run snapshot fixtures
make update-snapshots          # regenerate snapshots after intentional changes
```{{ endif }}

Fixtures live in `tests/<name>/` with `answers.json` (input) and `snapshot/` (expected output).

## Publish

When the template is finished, request its registry entry:

{{ if build_system == "beez" }}```bash
beez publish
```{{ else }}```bash
make publish
```{{ endif }}

This re-runs checks + tests and then opens a registration issue in
[{{ registry_repo }}](https://github.com/{{ registry_repo }}) via the GitHub CLI (`gh`).

- Preview without creating anything: `PUBLISH_DRY_RUN=1 sh scripts/publish.sh`
- Override the target repo: `REGISTRY_REPO=owner/repo sh scripts/publish.sh`
- Without `gh` (or without auth), the script prints title + body so you can open the issue manually.
{{ if author }}
## Author

{{ author }}
{{ endif }}
