---@class Base.Plugin
local M = {}

M.did_setup = false

---Setup the chef plugin
---@param opts? Base.UserOptions plugin options
function M.setup(opts)
  if M.did_setup then
    local Util = require("chef.util")
    return Util.warn("chef.nvim is already setup")
  end
  M.did_setup = true
  require("chef.config").setup(opts)
end

---Say hello to the user
---@return string msg greeting message
function M.hello()
  local Config = require("chef.config")
  local str = "Hello " .. Config.name
  local Util = require("chef.util")
  Util.info(str)
  return str
end

---Say bye to the user
---@return string msg farewell message
function M.bye()
  local Config = require("chef.config")
  local str = "Bye " .. Config.name
  local Util = require("chef.util")
  Util.info(str)
  return str
end

return M
