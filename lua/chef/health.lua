---@class Chef.Health
local M = {}

---Health check called by `:checkhealth chef`
function M.check()
  vim.health.start("chef.nvim")

  if vim.fn.executable("curl") == 1 then
    vim.health.ok("curl is installed")
  else
    vim.health.error("curl is not installed. chef.nvim requires curl to fetch ASCII art.")
  end
end

return M
