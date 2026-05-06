---@module 'luassert'

local Ascii = require("chef.ascii")

describe("random_url", function()
  it("returns a URL from the list", function()
    local url = Ascii.random_url()
    assert.matches("https://git.io/", url)
  end)

  it("returns different URLs over multiple calls", function()
    local results = {}
    for _ = 1, 100 do
      results[Ascii.random_url()] = true
    end
    -- With 12 URLs and 100 calls, we should get at least 3 different ones
    local count = 0
    for _ in pairs(results) do
      count = count + 1
    end
    assert.is_true(count >= 3)
  end)
end)

describe("fetch", function()
  it("returns a string on success", function()
    local art = Ascii.fetch("https://git.io/coffee")
    assert.is_not_nil(art)
    assert.is_true(#art > 0)
  end)

  it("returns nil on failure", function()
    local art = Ascii.fetch("https://git.io/this-does-not-exist-xyz")
    assert.is_nil(art)
  end)
end)
