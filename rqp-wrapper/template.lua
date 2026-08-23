return {
  id = "rqp-wrapper",
  name = "ReqPack Wrapper",
  version = "0.1.0",
  description = "Scaffold a new ReqPack wrapper plugin for a package manager",
  source_dir = "files",
  output = {
    path = "{{ plugin_id }}",
    overwrite = false,
  },
}
