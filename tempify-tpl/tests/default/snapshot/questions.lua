return {
  order = { "Project" },
  groups = {
    Project = {
      {
        key = "project_name",
        type = "string",
        prompt = "Project name",
        default = "My App",
        help = "Display name used in generated files.",
      },
      {
        key = "project_slug",
        type = "string",
        prompt = "Project slug",
        default = function(ctx)
          return slugify(ctx.values.project_name or "my-app")
        end,
        validate = function(ctx)
          if not string.match(ctx.value, "^[a-z0-9%-]+$") then
            return "Slug must contain only lowercase letters, digits, and '-'."
          end
          return true
        end,
      },
    },
  },
}
