<div align="center">
  <h1>🍳&nbsp;&nbsp;chef.nvim&nbsp;&nbsp;🍳</h1>

  <p align="center">
    <a href="https://github.com/S1M0N38/chef.nvim/actions/workflows/ci.yml">
      <img alt="CI badge" src="https://img.shields.io/github/actions/workflow/status/S1M0N38/chef.nvim/ci.yml?style=for-the-badge&label=CI"/>
    </a>
    <a href="https://luarocks.org/modules/S1M0N38/chef.nvim">
      <img alt="LuaRocks badge" src="https://img.shields.io/luarocks/v/S1M0N38/chef.nvim?style=for-the-badge&color=5d2fbf"/>
    </a>
    <a href="https://github.com/S1M0N38/chef.nvim/releases">
      <img alt="GitHub badge" src="https://img.shields.io/github/v/release/S1M0N38/chef.nvim?style=for-the-badge&label=GitHub"/>
    </a>
  </p>
  <p><em>Suggestions for your next meal</em></p>
</div>

______________________________________________________________________

## 💡 Motivation

When you can't decide what to eat, let Neovim choose for you. `:Chef` picks a random food ASCII art from a curated collection and displays it in a floating terminal window. Simple, fun, and zero configuration.

## ⚡ Requirements

- **[Neovim](https://github.com/neovim/neovim)** ≥ 0.12.2
- **[curl](https://curl.se/)** — for fetching ASCII art from the network

## 📦 Installation

Install using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "S1M0N38/chef.nvim",
  lazy = false,
  opts = {},
}
```

For development, see [CONTRIBUTING.md](CONTRIBUTING.md).

## 🚀 Usage

Run the command:

```
:Chef
```

A floating window appears with a random food ASCII art — burger, pizza, taco, coffee, and more. Press `q` or `<Esc>` to close.

Each call picks a different image, so keep running `:Chef` until you find something appetizing!

Get started by reading the comprehensive documentation with [`:help chef`](https://github.com/S1M0N38/chef.nvim/blob/main/doc/chef.txt).
