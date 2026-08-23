# Sample Template

Sample template generated for the fixture

Generated with the Tempify `tempify-tpl` meta template.

## Layout

```text
sample-template/
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
tempify ./sample-template my-output --set project_name="My App"
```

Author: Tempify

