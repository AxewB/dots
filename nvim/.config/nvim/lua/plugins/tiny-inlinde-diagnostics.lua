vim.pack.add({
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
})

require("tiny-inline-diagnostic").setup({
  preset = "classic",
  transparent_bg = false,

  options = {
    softwrap = 100,

    show_all_diags_on_cursorline = true,

    overflow = {
      mode = "none",
      padding = 0,
    },

    break_line = {
      enabled = false,
    },
  },
})
vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
