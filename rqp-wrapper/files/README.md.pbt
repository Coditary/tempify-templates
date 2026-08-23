# {{ plugin_name }} ReqPack Wrapper

ReqPack wrapper plugin for {{ system_name }}.

Generated with the Tempify `rqp-wrapper` template.

## Layout

```text
{{ plugin_id }}/
  metadata.json       Plugin metadata
  reqpack.lua         Bundle manifest
  run.lua             Wrapper implementation
  scripts/            Install/remove hooks
  .reqpack-test/      Hermetic test cases
  API.md              This file
```

## Development

### Prerequisites

- [ReqPack](https://github.com/Coditary/ReqPack) installed
{{ if required_binary }}- `{{ required_binary }}` available in PATH
{{ endif }}
### Test

```bash
rqp test-plugin --plugin . --preset core
```

### Implement

Edit `run.lua` to replace placeholder commands with real `{{ system_name }}` calls.

Key methods to implement:

| Method | Purpose |
|--------|---------|
| `plugin.getMissingPackages` | Detect installed vs missing state |
| `plugin.install` | Install packages |
| `plugin.installLocal` | Install from local path |
| `plugin.remove` | Remove packages |
| `plugin.update` | Update packages |
| `plugin.list` | List installed packages |
| `plugin.search` | Search available packages |
| `plugin.info` | Get package details |
| `plugin.outdated` | Check for updates |

## Install via ReqPack

```bash
rqp install rqp:{{ plugin_id }}
```
{{ if author }}
## Author

{{ author }}
{{ endif }}
