vim.pack.add({
  { src = "https://github.com/romgrk/barbar.nvim" },
})
vim.g.barbar_auto_setup = false -- disable auto-setup

require("barbar").setup({
  animation = false,
  auto_hide = true,
  tabpages = false,
  clickable = true,
  focus_on_close = "left",

  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = { extensions = false, inactive = false },

  icons = {
    button = "",
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true },
      [vim.diagnostic.severity.WARN] = { enabled = true },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = true },
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = false,
    },
    separator = { left = "▎", right = "" },

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = false,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = { button = "*" },
    pinned = { button = "", filename = true },

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = "slanted",

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = { filetype = { enabled = false } },
    current = { buffer_index = true },
    inactive = { button = "" },
    visible = { modified = { buffer_number = false } },
  },

  maximum_padding = 1,
  minimum_padding = 1,

  semantic_letters = true,

  letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
})
