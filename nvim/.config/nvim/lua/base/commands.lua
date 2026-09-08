-- date and time insertion
vim.api.nvim_create_user_command(
  "Date",
  "put =strftime('%Y-%m-%d')",
  { desc = "Insert date (YYYY-MM-DD)" }
)
vim.api.nvim_create_user_command(
  "Time",
  "put =strftime('%H:%M:%S')",
  { desc = "Insert time (HH:MM:SS)" }
)

vim.api.nvim_create_user_command(
  "DateTime",
  "put =strftime('%Y-%m-%d %H-%M-%S')",
  { desc = "Insert datetime (YYYY-MM-DD HH-MM-SS)" }
)

local saved_number = true
local saved_relativenumber = false
local saved_signcolumn = "auto"

local first_launch = true

vim.api.nvim_create_user_command("DisableNumberColumn", function(opts)
  if first_launch then
    saved_number = vim.opt.number:get()
    saved_relativenumber = vim.opt.relativenumber:get()
    saved_signcolumn = vim.opt.signcolumn:get()
    first_launch = false
  end

  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.opt.signcolumn = "no"
end, {})

vim.api.nvim_create_user_command("EnableNumberColumn", function(opts)
  if first_launch then
    return
  end

  vim.opt.number = saved_number
  vim.opt.relativenumber = saved_relativenumber
  vim.opt.signcolumn = saved_signcolumn
end, {})

vim.api.nvim_create_user_command("ToggleSpell", function()
  if vim.opt.spell:get() then
    vim.opt.spell = false
  else
    vim.opt.spell = true
  end
end, {})

vim.api.nvim_create_user_command("UpdateAllPlugins", function()
  vim.pack.update()
end, {})
