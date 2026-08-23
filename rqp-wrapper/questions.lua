return {
  order = { "Plugin", "System" },
  groups = {
    Plugin = {
      {
        key = "plugin_name",
        type = "string",
        prompt = "Plugin display name",
        default = "My Wrapper",
        help = "Human-readable name shown in ReqPack listings.",
      },
      {
        key = "plugin_id",
        type = "string",
        prompt = "Plugin id",
        default = function(ctx)
          return slugify(ctx.values.plugin_name or "my-wrapper")
        end,
        help = "Unique id used for discovery and folder name.",
        validate = function(ctx)
          if not string.match(ctx.value, "^[a-z0-9%-_]+$") then
            return "Plugin id must contain only lowercase letters, digits, '-' and '_'."
          end
          return true
        end,
      },
      {
        key = "plugin_version",
        type = "string",
        prompt = "Plugin version",
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
    System = {
      {
        key = "system_name",
        type = "string",
        prompt = "ReqPack system name",
        default = function(ctx)
          return ctx.values.plugin_id or "my-system"
        end,
        help = "System identifier used in ReqPack requests (e.g. apt, npm, pip).",
      },
      {
        key = "required_binary",
        type = "string",
        prompt = "Required CLI binary",
        default = function(ctx)
          return ctx.values.plugin_id or ""
        end,
        help = "Binary checked in plugin.init(). Leave empty to skip check.",
        optional = true,
      },
    },
  },
}
