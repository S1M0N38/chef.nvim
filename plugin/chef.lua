-- In this file you define the User commands, i.e. how the user will interact with your plugin.
-- The require() is inside the callback — the main module is only loaded when the user
-- actually invokes the command (lazy-loading).

vim.api.nvim_create_user_command("Chef", function()
  require("chef").hello()
end, {
  desc = "Chef example command",
})

-- RESOURCES:
--  - :help nvim_create_user_command()
--  - https://github.com/lumen-oss/nvim-best-practices?tab=readme-ov-file#speaking_head-user-commands
