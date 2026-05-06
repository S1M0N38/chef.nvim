---@meta _
--- Definition file for LuaLS type information. Not loaded at runtime.
--- See: https://luals.github.io/wiki/definition-files/

-- lua/chef/init.lua -----------------------------------------------------------

---@class Chef.Plugin
---@field setup fun(opts?: table) setup the plugin (no-op, for compatibility)
---@field serve fun() fetch random ASCII art and show in floating window

-- lua/chef/ascii.lua ----------------------------------------------------------

---@class Chef.Ascii
---@field random_url fun(): string pick a random ASCII art URL
---@field fetch fun(url: string): string? fetch ASCII art via curl

-- lua/chef/float.lua ----------------------------------------------------------

---@class Chef.Float
---@field open fun(content: string) open floating terminal with content

-- lua/chef/util.lua -----------------------------------------------------------

---@class Chef.Util
---@field notify fun(msg: string, level?: integer) send notification with plugin title
---@field info fun(msg: string) send info notification
---@field warn fun(msg: string) send warning notification
---@field error fun(msg: string) send error notification

-- lua/chef/health.lua ---------------------------------------------------------

---@class Chef.Health
---@field check fun() perform health check for the plugin
