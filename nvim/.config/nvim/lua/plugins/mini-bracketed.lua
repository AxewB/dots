vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.bracketed" },
})

-- stylua: ignore start
require("mini.bracketed").setup({
  -- buffer     = { suffix = 'b', options = {} },
  comment    = { suffix = 'c', options = {} },
  conflict   = { suffix = 'x', options = {} },
  diagnostic = { suffix = 'd', options = {} },
})
-- stylua: ignore end
