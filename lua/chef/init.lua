---@class Chef.Plugin
local M = {}

---Setup the chef plugin (no-op, kept for plugin manager compatibility)
---@param opts? table unused
function M.setup(opts) -- luacheck: ignore 212
end

---Fetch a random ASCII art and show it in a floating window
function M.serve()
  local Ascii = require("chef.ascii")
  local Float = require("chef.float")
  local Util = require("chef.util")

  local url = Ascii.random_url()
  local art = Ascii.fetch(url)

  if not art then
    Util.error("Failed to fetch ASCII art from " .. url)
    return
  end

  Float.open(art)
end

return M
