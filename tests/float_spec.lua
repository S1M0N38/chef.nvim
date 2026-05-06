---@module 'luassert'

local Float = require("chef.float")

describe("float.open", function()
  local wins_before

  before_each(function()
    wins_before = #vim.api.nvim_list_wins()
  end)

  after_each(function()
    -- Clean up any floating windows we opened
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(win).relative ~= "" then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end)

  it("opens a floating window", function()
    Float.open("Hello, chef.nvim!")
    local wins_after = #vim.api.nvim_list_wins()
    assert.are.equal(wins_before + 1, wins_after)
  end)

  it("creates a scratch buffer", function()
    Float.open("Hello, chef.nvim!")
    local wins = vim.api.nvim_list_wins()
    local float_win = wins[#wins]
    local buf = vim.api.nvim_win_get_buf(float_win)
    assert.is_true(vim.bo[buf].buflisted == false)
    assert.is_true(vim.bo[buf].bufhidden ~= "")
  end)

  it("sets q and <Esc> keymaps for closing", function()
    Float.open("Hello, chef.nvim!")
    local wins = vim.api.nvim_list_wins()
    local float_win = wins[#wins]
    local buf = vim.api.nvim_win_get_buf(float_win)

    local maps = vim.api.nvim_buf_get_keymap(buf, "n")
    local keys = {}
    for _, m in ipairs(maps) do
      keys[m.lhs] = true
    end
    assert.is_not_nil(keys["q"])
    assert.is_not_nil(keys["<Esc>"])
  end)

  it("window has rounded border", function()
    Float.open("Hello, chef.nvim!")
    local wins = vim.api.nvim_list_wins()
    local float_win = wins[#wins]
    local config = vim.api.nvim_win_get_config(float_win)
    assert.are.equal("editor", config.relative)
    -- border is expanded to chars, check first char of rounded style
    assert.are.equal("╭", config.border[1])
  end)
end)
