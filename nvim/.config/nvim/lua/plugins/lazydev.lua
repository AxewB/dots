vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
require("lazydev").setup({
  ft = "lua", -- only load on lua files
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { "nvim-dap-ui" },
  },
})
