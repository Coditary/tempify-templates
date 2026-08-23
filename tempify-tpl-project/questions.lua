return {
  order = { "Template", "Automation", "Registry" },
  groups = {
    Template = {
      {
        key = "template_name",
        type = "string",
        prompt = "Template display name",
        default = "My Template",
        help = "Human-readable name shown in template listings.",
      },
      {
        key = "template_id",
        type = "string",
        prompt = "Template id",
        default = function(ctx)
          return slugify(ctx.values.template_name or "my-template")
        end,
        help = "Unique id used for the output folder and registry entry.",
        validate = function(ctx)
          if not string.match(ctx.value, "^[a-z0-9%-_]+$") then
            return "Template id must contain only lowercase letters, digits, '-' and '_'."
          end
          return true
        end,
      },
      {
        key = "template_description",
        type = "string",
        prompt = "Template description",
        default = "A new Tempify template",
      },
      {
        key = "template_version",
        type = "string",
        prompt = "Template version",
        default = "0.1.0",
      },
      {
        key = "author",
        type = "string",
        prompt = "Author",
        optional = true,
        help = "Optional. Enter '-' to skip.",
      },
    },
    Automation = {
      {
        key = "build_system",
        type = "choice",
        prompt = "Build automation",
        choices = { "beez", "make" },
        default = "beez",
        help = "Beez (build.lua) by default. Use --set build_system=make for a Makefile.",
      },
    },
    Registry = {
      {
        key = "registry_repo",
        type = "string",
        prompt = "Registry repository",
        default = "Coditary/tempify-registry",
        help = "GitHub repo (owner/name) whose issue tracker receives publish requests.",
      },
      {
        key = "template_tags",
        type = "string",
        prompt = "Template tags",
        default = "starter",
        help = "Comma-separated tags for the registry entry.",
      },
    },
  },
}
