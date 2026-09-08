vim.pack.add({
  { src = "https://github.com/Xemptuous/sqlua.nvim" },
})

require("sqlua").setup({
  cmd = "SQLua",
})
