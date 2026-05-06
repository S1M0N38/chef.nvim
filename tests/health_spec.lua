---@module 'luassert'

local health = require("chef.health")

describe("health check", function()
  it("runs without errors when curl is available", function()
    assert.has_no.errors(function()
      health.check()
    end)
  end)
end)
