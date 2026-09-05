vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
  -- deps
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})
require('treesitter-context').setup({
  max_lines = 0,           -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0,  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 5, -- Maximum number of lines to show for a single context
  trim_scope = 'inner',    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',         -- Line used to calculate context. Choices: 'cursor', 'topline'
})
