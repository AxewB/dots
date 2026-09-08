vim.pack.add({
  { src = "https://github.com/kylechui/nvim-surround" },
})

require("nvim-surround").setup({
  surrounds = {
    ["("] = {
      add = { "(", ")" },
      delete = "^(. ?)().-( ?.)()$",
      label = "( ... )",
    },
    ["{"] = {
      add = { "{", "}" },
      delete = "^(. ?)().-( ?.)()$",
      label = "{ ... }",
    },
    ["<"] = {
      add = { "<", ">" },
      delete = "^(. ?)().-( ?.)()$",
      label = "< ... >",
    },
    ["["] = {
      add = { "[", "]" },
      delete = "^(. ?)().-( ?.)()$",
      label = "[ ... ]",
    },
    ["'"] = {
      add = { "'", "'" },
      delete = "^(.)().-(.)()$",
      label = "'...'",
    },
    ['"'] = {
      add = { '"', '"' },
      delete = "^(.)().-(.)()$",
      label = '"..."',
    },
    ["`"] = {
      add = { "`", "`" },
      delete = "^(.)().-(.)()$",
      label = "`...`",
    },
  },

  aliases = {
    ["a"] = ">",
    ["b"] = ")",
    ["B"] = "}",
    ["r"] = "]",
    ["q"] = { '"', "'", "`" },
    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
  },
})

vim.g.nvim_surround_no_mappings = true

vim.keymap.set("v", "s", "<Plug>(nvim-surround-visual)", {
  desc = "Add surrounding",
})
-- vim.keymap.set("n", "S", "<Plug>(nvim-surround-normal-cur)", {
--   desc = "Добавить окружение вокруг текущей строки",
-- })
vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", {
  desc = "Remove surrounding",
})
vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", {
  desc = "Change surrounding",
})
