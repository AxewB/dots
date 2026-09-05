vim.pack.add({
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

  -- dependencies
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-mini/mini.icons" },
})

require("render-markdown").setup({
  code = {
    language_border = "█",
    language_left = "██", -- 
    language_right = "██", -- 
    border = "thick",
    sign = false,
  },
  pipe_table = {
    preset = "round",
    alignment_indicator = "┅",
  },
  -- indent = {
  --   enabled = true,
  --   icon = '█',
  --   skip_level = 1,
  --   skip_heading = true,
  -- },
})
