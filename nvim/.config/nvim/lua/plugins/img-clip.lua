vim.pack.add({
  { src = 'https://github.com/hakonharnes/img-clip.nvim' },
})

require('img-clip').setup({
  filetypes = {
    typst = {
      template = [[
image("$FILE_PATH")
    ]], ---@type string | fun(context: table): string
    },
  },
})

vim.keymap.set({ 'n', 'i' }, '<C-S-p>', '<cmd>PasteImage<cr>', { desc = 'Paste image from system clipboard' })
