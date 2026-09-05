vim.pack.add({
  { src = 'https://github.com/YousefHadder/markdown-plus.nvim' },
})

require('markdown-plus').setup({
  filetypes = { 'markdown', 'typst' },
})
