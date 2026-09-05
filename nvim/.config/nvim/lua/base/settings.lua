vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.encoding = "utf8"

vim.opt.cursorline = false
vim.opt.smoothscroll = false
-- vim.opt.colorcolumn = "80"
vim.opt.scrolloffpad = 1
-- vim.opt.guicursor = "a:block"

-- SEARCH settings
-- ignore case in search
vim.opt.ignorecase = true
-- case sensitive only when capital letter in search request
vim.opt.smartcase = true

-- spell check
-- download russian dictionary:
-- wget -q --show-progress https://ftp.nluug.nl/vim/runtime/spell/ru.utf-8.{spl,sug}
vim.opt.spell = false
vim.opt.spelllang = { "en_us", "ru_ru" }

-- default split to right (like quickfix, help, man)
vim.opt.splitright = true

-- centering cursor
vim.opt.scrolloff = 99
vim.opt.sidescrolloff = 99
vim.opt.clipboard = "unnamedplus" -- yank into system clipboard

-- line numberd and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.signcolumn = "no" -- remove jittering when plugins use this column

-- show invisible symbols
vim.opt.list = true
vim.opt.showbreak = "↪ "
vim.opt.listchars = {
  leadmultispace = "· ",
  tab = "→·",
  eol = " ",
  -- eol = "↲",
  trail = "~",
  nbsp = "␣",
  extends = "⟩",
  precedes = "⟨",
}


-- enable 0.12 new ui feature
require("vim._core.ui2").enable({})

-- winbar
-- vim.o.winbar = " %f %= %m %r"

-- -- langmap
-- vim.opt.langmap = ""
--   .. "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;"
--   .. "ABCDEFGHIJKLMNOPQRSTUVWXYZ,"
--   --
--   .. "фисвуапршолдьтщзйкыегмцчня;"
--   .. "abcdefghijklmnopqrstuvwxyz"

-- languages specific settings
local languages = {
  python = { tabstop = 4, softtabstop = 4, shiftwidth = 4, expandtab = true },
  qml = { tabstop = 2, softtabstop = 2, shiftwidth = 2, expandtab = true },
  markdown = { tabstop = 2, softtabstop = 2, shiftwidth = 2, expandtab = true },
  slint = { tabstop = 4, softtabstop = 4, shiftwidth = 4, expandtab = true },
  rust = { tabstop = 2, softtabstop = 2, shiftwidth = 2, expandtab = true },
  nix = { tabstop = 2, softtabstop = 2, shiftwidth = 2, expandtab = true },
}

for ft, ft_opts in pairs(languages) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      for k, v in pairs(ft_opts) do
        vim.opt_local[k] = v
      end
    end,
  })
end

-- load undo tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("packadd nvim.undotree")
    vim.cmd("packadd nvim.tohtml")
    vim.cmd("packadd nvim.difftool")
  end,
})


-- italic comments
vim.o.termguicolors = true
vim.api.nvim_set_hl(0, "Comment", { italic = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Comment", { italic = true })
  end,
})
