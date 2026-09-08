vim.pack.add({
  { src = "https://github.com/lambdalisue/vim-suda" },
})

vim.keymap.set("n", "<leader>W", "<CMD>SudaWrite<CR>")
