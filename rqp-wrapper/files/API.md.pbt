# {{ plugin_name }}

ReqPack wrapper plugin for {{ system_name }}.

Generated with the Tempify `rqp-wrapper` template.

## Quick start

```bash
rqp install rqp:{{ plugin_id }}
rqp install {{ system_name }} <package>
```

## Development

```bash
rqp test-plugin --plugin . --preset core
```

See `API.md` for the full plugin contract reference.
{{ if author }}
## Author

{{ author }}
{{ endif }}
