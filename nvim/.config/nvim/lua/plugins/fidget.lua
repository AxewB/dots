-- plugin: fidget.nvim
vim.pack.add({
  { src = "https://github.com/j-hui/fidget.nvim" },
})
require("fidget").setup({
  notification = {
    filter = vim.log.levels.INFO,
    view = {
      stack_upwards = false,
    },
    window = {
      align = "bottom",
    },
    history_size = 256,
  },
})
