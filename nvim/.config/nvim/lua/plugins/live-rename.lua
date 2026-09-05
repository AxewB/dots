vim.pack.add({
  { src = 'https://github.com/saecki/live-rename.nvim' },
})

local live_rename = require('live-rename')

live_rename.setup({
  keys = {
    submit = {
      { 'n', '=' },
      { 'n', '<leader>w' },
      { 'v', '=' },
      { 'i', '<cr>' },
    },
    cancel = {
      { 'n', '<esc>' },
      { 'n', 'q' },
    },
  },
})

-- The following are equivalent
vim.keymap.set('n', '<leader>lr', live_rename.rename, { desc = 'LSP rename' })
-- vim.keymap.set("n", "gR", live_rename.map({ text = "", insert = true }), { desc = "LSP rename" })
