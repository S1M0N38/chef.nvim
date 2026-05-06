---@class Chef.Ascii
local M = {}

local urls = {
  "https://git.io/ricex",
  "https://git.io/unix",
  "https://git.io/taco",
  "https://git.io/pizzza",
  "https://git.io/pancakes",
  "https://git.io/poptart",
  "https://git.io/waffles",
  "https://git.io/burger",
  "https://git.io/rice",
  "https://git.io/vburger",
  "https://git.io/pizzzza",
  "https://git.io/coffee",
}

---Pick a random ASCII art URL
---@return string url
function M.random_url()
  return urls[math.random(#urls)]
end

---Fetch ASCII art from a URL using curl (synchronous)
---@param url string
---@return string? art nil on error
function M.fetch(url)
  local out = vim.fn.system({ "curl", "-L", "--silent", "--fail", url })
  if vim.v.shell_error ~= 0 then
    return nil
  end
  return out
end

return M
