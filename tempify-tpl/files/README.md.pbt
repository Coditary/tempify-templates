# {{ template_name }}

{{ template_description }}

Generated with the Tempify `tempify-tpl` meta template.

## Layout

```text
{{ template_id }}/
  template.lua      Template manifest
  questions.lua     Interactive questions
  files/            Source files (`.pbt` files are rendered, the rest is copied)
  tests/            Snapshot fixtures for `tempify test`
```

## Develop

```bash
tempify validate .
tempify lint .
tempify test .
tempify test . --update-snapshots   # after intentional output changes
```

## Use

```bash
tempify ./{{ template_id }} my-output --set project_name="My App"
```
{{ if author }}
Author: {{ author }}
{{ endif }}
