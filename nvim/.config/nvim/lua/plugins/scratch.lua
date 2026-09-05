vim.pack.add({
  { src = "https://git.sr.ht/~swaits/scratch.nvim" },
})

require("scratch").setup({})

vim.keymap.set(
  "n",
  "<C-s>",
  "<CMD>Scratch<CR>",
  { desc = "Open scratch buffer" }
)
