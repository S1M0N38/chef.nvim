vim.api.nvim_create_user_command("Chef", function()
  require("chef").serve()
end, {
  desc = "Suggest your next meal with ASCII art",
})
