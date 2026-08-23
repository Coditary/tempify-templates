-- Keep only the build file matching the chosen build system.
if ctx.values.build_system == "make" then
  if exists("build.lua") then
    remove("build.lua")
  end
else
  if exists("Makefile") then
    remove("Makefile")
  end
end

-- exec() runs in the tempify process cwd, so use an absolute, quoted path.
local function shquote(path)
  return "'" .. tostring(path):gsub("'", "'\\''") .. "'"
end

local publish_script = get_build_root() .. "/scripts/publish.sh"
if exists("scripts/publish.sh") then
  exec("chmod +x " .. shquote(publish_script))
end
