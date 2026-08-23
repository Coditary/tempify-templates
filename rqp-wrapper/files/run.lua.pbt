plugin = {}

local PLUGIN_NAME = "{{ plugin_name }}"
local PLUGIN_VERSION = "{{ plugin_version }}"
local REQUIRED_BINARY = "{{ required_binary }}"

local function trim(value)
    return (tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", ""))
end

local function shell_quote(value)
    return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

local function emit_event(context, name, payload)
    if context == nil or context.events == nil then
        return
    end
    local fn = context.events[name]
    if type(fn) == "function" then
        fn(payload)
    end
end

local function begin_step(context, label)
    if context == nil or context.tx == nil then
        return
    end
    local fn = context.tx.begin_step
    if type(fn) == "function" then
        fn(label)
    end
end

local function tx_success(context)
    if context == nil or context.tx == nil then
        return
    end
    local fn = context.tx.success
    if type(fn) == "function" then
        fn()
    end
end

local function tx_failed(context, message)
    if context == nil or context.tx == nil then
        return
    end
    local fn = context.tx.failed
    if type(fn) == "function" then
        fn(message)
    end
end

local function command_exists(binary)
    return reqpack.exec.run("command -v " .. shell_quote(binary) .. " >/dev/null 2>&1").success
end

local function run_shell(command)
    local handle = io.popen(command .. " 2>&1")
    if handle == nil then
        return false, "", 1
    end
    local output = handle:read("*a") or ""
    local ok, _, code = handle:close()
    if ok == true then
        return true, output, 0
    end
    return false, output, tonumber(code) or 1
end

plugin.fileExtensions = {}

function plugin.getName()
    return PLUGIN_NAME
end

function plugin.getVersion()
    return PLUGIN_VERSION
end

function plugin.getRequirements()
    return {}
end

function plugin.getCategories()
    return { "Wrapper", "{{ system_name }}" }
end

function plugin.getMissingPackages(packages)
    return packages or {}
end

function plugin.install(context, packages)
    begin_step(context, "install {{ system_name }} packages")
    for _, pkg in ipairs(packages or {}) do
        local name = trim(pkg.name)
        local version = trim(pkg.version)
        local cmd = "{{ system_name }} install " .. shell_quote(name)
        if version ~= "" then
            cmd = cmd .. "==" .. version
        end
        local ok, output, code = run_shell(cmd)
        if not ok then
            tx_failed(context, "install failed: " .. name .. "\n" .. output)
            return false
        end
        emit_event(context, "installed", { name = name, version = version })
    end
    tx_success(context)
    return true
end

function plugin.installLocal(context, path)
    begin_step(context, "install local {{ system_name }} artifact")
    local cmd = "{{ system_name }} install " .. shell_quote(path)
    local ok, output, code = run_shell(cmd)
    if not ok then
        tx_failed(context, "local install failed: " .. output)
        return false
    end
    emit_event(context, "installed", { path = path, localTarget = true })
    tx_success(context)
    return true
end

function plugin.remove(context, packages)
    begin_step(context, "remove {{ system_name }} packages")
    for _, pkg in ipairs(packages or {}) do
        local name = trim(pkg.name)
        local cmd = "{{ system_name }} remove " .. shell_quote(name)
        local ok, output, code = run_shell(cmd)
        if not ok then
            tx_failed(context, "remove failed: " .. name .. "\n" .. output)
            return false
        end
        emit_event(context, "deleted", { name = name })
    end
    tx_success(context)
    return true
end

function plugin.update(context, packages)
    begin_step(context, "update {{ system_name }} packages")
    for _, pkg in ipairs(packages or {}) do
        local name = trim(pkg.name)
        local cmd = "{{ system_name }} update " .. shell_quote(name)
        local ok, output, code = run_shell(cmd)
        if not ok then
            tx_failed(context, "update failed: " .. name .. "\n" .. output)
            return false
        end
        emit_event(context, "updated", { name = name })
    end
    tx_success(context)
    return true
end

function plugin.list(context)
    begin_step(context, "list {{ system_name }} packages")
    local ok, output, code = run_shell("{{ system_name }} list")
    local items = {}
    if ok then
        for line in output:gmatch("[^\n]+") do
            local name, version = line:match("^(%S+)%s+(%S+)")
            if name then
                table.insert(items, {
                    name = name,
                    version = version,
                    type = "package",
                })
            end
        end
    end
    emit_event(context, "listed", items)
    return items
end

function plugin.search(context, prompt)
    begin_step(context, "search {{ system_name }} packages")
    local query = trim(prompt)
    if query == "" then
        emit_event(context, "searched", {})
        return {}
    end
    local ok, output, code = run_shell("{{ system_name }} search " .. shell_quote(query))
    local items = {}
    if ok then
        for line in output:gmatch("[^\n]+") do
            local name, version = line:match("^(%S+)%s+(%S+)")
            if name then
                table.insert(items, {
                    name = name,
                    version = version,
                    type = "package",
                    summary = line,
                })
            end
        end
    end
    emit_event(context, "searched", items)
    return items
end

function plugin.info(context, name)
    local wanted = trim(name)
    if wanted == "" then
        emit_event(context, "informed", {})
        return {}
    end
    local ok, output, code = run_shell("{{ system_name }} info " .. shell_quote(wanted))
    local item = {
        name = wanted,
        version = "",
        description = output,
    }
    if ok then
        local version = output:match("version:%s*(%S+)")
        if version then
            item.version = version
        end
    end
    emit_event(context, "informed", item)
    return item
end

function plugin.outdated(context)
    begin_step(context, "check outdated {{ system_name }} packages")
    local ok, output, code = run_shell("{{ system_name }} outdated")
    local items = {}
    if ok then
        for line in output:gmatch("[^\n]+") do
            local name, version, latest = line:match("^(%S+)%s+(%S+)%s+(%S+)")
            if name then
                table.insert(items, {
                    name = name,
                    version = version,
                    latestVersion = latest,
                    type = "package",
                })
            end
        end
    end
    emit_event(context, "outdated", items)
    return items
end

function plugin.init()
    if REQUIRED_BINARY ~= "" then
        return command_exists(REQUIRED_BINARY)
    end
    return true
end

function plugin.shutdown()
    return true
end

return plugin
