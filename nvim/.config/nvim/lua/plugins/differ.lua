vim.pack.add({
  { src = "https://github.com/undont/differ.nvim" },
})

require("differ").setup({
  panel = {
    position = "bottom",
  },
  relative_dates = true,
  layout = "split"
})
