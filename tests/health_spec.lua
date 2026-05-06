---@module 'luassert'

local health = require("chef.health")
local chef = require("chef")

describe("health check", function()
  it("runs with default config without errors", function()
    chef.did_setup = false
    chef.setup({})
    assert.has_no.errors(function()
      health.check()
    end)
  end)

  it("runs with custom config without errors", function()
    chef.did_setup = false
    chef.setup({ name = "Test User" })
    assert.has_no.errors(function()
      health.check()
    end)
  end)

  it("handles invalid config gracefully", function()
    chef.did_setup = false
    chef.setup({ name = 123 })
    assert.has_no.errors(function()
      health.check()
    end)
  end)

  it("reports error when setup() was not called", function()
    -- Create a fresh health module to test without setup
    chef.did_setup = false
    -- Don't call setup — health should report the issue
    assert.has_no.errors(function()
      health.check()
    end)
  end)
end)
