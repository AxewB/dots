vim.pack.add({
  { src = "https://github.com/arnamak/stay-centered.nvim" },
})

require("stay-centered").setup({
  skip_filetypes = {},
  enabled = true,
  allow_scroll_move = true,
  disable_on_mouse = true,
})

-- disable scrolloff when this plugin is enabled
vim.opt.scrolloff = 0
