return {
  id = "tempify-tpl",
  name = "Tempify Template",
  version = "0.1.0",
  description = "Minimal scaffold for authoring a new Tempify template",
  source_dir = "files",
  output = {
    path = "{{ template_id }}",
    overwrite = false,
  },
}
