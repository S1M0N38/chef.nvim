---@module 'luassert'

local Chef = require("chef")

describe("setup", function()
  it("does not error with no args", function()
    assert.has_no.errors(function()
      Chef.setup()
    end)
  end)

  it("does not error with empty table", function()
    assert.has_no.errors(function()
      Chef.setup({})
    end)
  end)
end)

describe("serve", function()
  local original_fetch
  local original_open
  local fetch_calls
  local open_calls

  before_each(function()
    local Ascii = require("chef.ascii")
    local Float = require("chef.float")

    fetch_calls = {}
    open_calls = {}

    -- Stub Ascii.random_url to return a fixed URL
    Ascii.random_url = function()
      return "https://git.io/coffee"
    end

    -- Stub Ascii.fetch to avoid network calls
    original_fetch = Ascii.fetch
    Ascii.fetch = function(url)
      table.insert(fetch_calls, url)
      return "fake ascii art"
    end

    -- Stub Float.open to avoid opening windows
    original_open = Float.open
    Float.open = function(content)
      table.insert(open_calls, content)
    end
  end)

  after_each(function()
    local Ascii = require("chef.ascii")
    local Float = require("chef.float")
    Ascii.fetch = original_fetch
    Float.open = original_open
  end)

  it("calls fetch with the random URL", function()
    Chef.serve()
    assert.are.equal(1, #fetch_calls)
    assert.are.equal("https://git.io/coffee", fetch_calls[1])
  end)

  it("calls Float.open with fetched content", function()
    Chef.serve()
    assert.are.equal(1, #open_calls)
    assert.are.equal("fake ascii art", open_calls[1])
  end)

  it("shows error notification when fetch fails", function()
    local Ascii = require("chef.ascii")
    Ascii.fetch = function()
      return nil
    end

    local notify_calls = {}
    local original_notify = vim.notify
    vim.notify = function(msg, level, opts)
      table.insert(notify_calls, { msg = msg, level = level, title = opts and opts.title })
    end

    Chef.serve()

    vim.wait(100, function()
      return #notify_calls > 0
    end, 20)
    vim.notify = original_notify

    assert.are.equal(1, #notify_calls)
    assert.matches("Failed to fetch", notify_calls[1].msg)
    assert.are.equal(vim.log.levels.ERROR, notify_calls[1].level)
    assert.are.equal("chef.nvim", notify_calls[1].title)

    -- Float.open should NOT have been called
    assert.are.equal(0, #open_calls)
  end)
end)
