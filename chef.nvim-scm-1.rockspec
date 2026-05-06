---@diagnostic disable: lowercase-global

local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
version = _MODREV .. _SPECREV

local user = "S1M0N38"
package = "chef.nvim"

description = {
	summary = "Suggestions for your next meal",
	detailed = [[
chef.nvim is a fun little plugin that suggests what to cook next. Run :Chef
and a floating window appears with an ASCII art meal suggestion — because
even developers need culinary inspiration.
  ]],
	labels = { "neovim", "plugin", "lua" },
	homepage = "https://github.com/" .. user .. "/" .. package,
	license = "MIT",
}

dependencies = {
	"lua >= 5.1",
}

source = {
	url = "git://github.com/" .. user .. "/" .. package,
}

build = {
	type = "builtin",
}
