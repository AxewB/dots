-- TODO: make theme selector (theme list in one file, current theme in another and enable only current)
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
})
require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    alpha = true,
    mason = true,
    treesitter = true,
    harpoon = true,
    blink_cmp = true,
    telescope = true,
    nvim_hlgroup_lists = true,
    -- fzf = true,
  },
  highlight = { enable = true },
})
