return {
  id = "tempify-tpl-project",
  name = "Tempify Template Project",
  version = "0.1.0",
  description = "Template-authoring project with checks, snapshot tests, and registry publish automation (Beez or Makefile)",
  source_dir = "files",
  output = {
    path = "{{ template_id }}",
    overwrite = false,
  },
}
