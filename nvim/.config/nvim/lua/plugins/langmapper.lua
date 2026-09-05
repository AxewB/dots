-- plugin: langmapper
-- desc: позволяет использовать русскую раскладку при использовании neovim
vim.pack.add({ { src = "https://github.com/Wansmer/langmapper.nvim" } })

local function escape(str)
  local escape_chars = [[;,."|\\]]
  return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift =
  [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift) .. ";" .. escape(en_shift),
  escape(ru) .. ";" .. escape(en),
}, ",")

local lm = require("langmapper")

lm.setup({
  hack_keymap = true,
  default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]`]],
  use_layouts = {},
  custom_desc = nil,
  layouts = {
    ru = {
      id = "russian",
      layout = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪËфисвуапршолдьтщзйкыегмцчнябюжэхъё",
      default_layout = nil,
    },
  },
})

lm.automapping({ global = true, buffer = true })
