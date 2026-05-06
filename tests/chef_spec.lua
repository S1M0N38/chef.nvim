---@module 'luassert'

local chef = require("chef")
chef.setup({})

describe("default options", function()
  it("hello() returns greeting with default name", function()
    assert.are.equal("Hello John Doe", chef.hello())
  end)

  it("bye() returns farewell with default name", function()
    assert.are.equal("Bye John Doe", chef.bye())
  end)

  it("setup() sets did_setup to true", function()
    assert.is_true(chef.did_setup)
  end)
end)

describe("user defined options", function()
  before_each(function()
    -- Reset did_setup to allow re-setup in tests
    chef.did_setup = false
    chef.setup({ name = "World" })
  end)

  it("hello() returns greeting with custom name", function()
    assert.are.equal("Hello World", chef.hello())
  end)

  it("bye() returns farewell with custom name", function()
    assert.are.equal("Bye World", chef.bye())
  end)
end)

describe("double setup guard", function()
  it("warns on second setup() call", function()
    chef.did_setup = false
    chef.setup({ name = "First" })
    -- Second call should not error, just warn
    assert.has_no.errors(function()
      chef.setup({ name = "Second" })
    end)
    -- Name should still be "First" since second setup was rejected
    assert.are.equal("Hello First", chef.hello())
  end)
end)
