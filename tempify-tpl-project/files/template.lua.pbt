return {
  id = "{{ template_id }}",
  name = "{{ template_name }}",
  version = "{{ template_version }}",
  description = "{{ template_description }}",
  source_dir = "files",
  output = {
    path = "{{ "{{" }} project_slug {{ "}}" }}",
    overwrite = false,
  },
}
