# Apt Wrapper

ReqPack wrapper plugin for apt.

Generated with the Tempify `rqp-wrapper` template.

## Layout

```text
apt-wrapper/
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
- `apt` available in PATH

### Test

```bash
rqp test-plugin --plugin . --preset core
```

### Implement

Edit `run.lua` to replace placeholder commands with real `apt` calls.

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
rqp install rqp:apt-wrapper
```

## Author

Test Author
