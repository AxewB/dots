vim.pack.add({
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

-- disable default bindings
vim.g.tmux_navigator_no_mappings = 1

-- stylua: ignore start
vim.keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<cr>",  { desc = "TmuxNavigateLeft"} )
vim.keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<cr>",  { desc = "TmuxNavigateDown"} )
vim.keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<cr>",    { desc = "TmuxNavigateUp"} )
vim.keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight"} )
-- stylua: ignore end
