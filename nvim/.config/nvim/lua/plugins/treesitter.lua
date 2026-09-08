vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "tree-sitter-d2" and kind == "install" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("tree-sitter-d2")
      end
      vim.system({ "make", "nvim-install" }, { cwd = ev.data.path })
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
  {
    src = "https://github.com/ravsii/tree-sitter-d2",
    version = vim.version.range("*"),
  },
})

require("nvim-treesitter").setup({
  ensure_installed = {
    "cpp",
    "javascript",
    "typescript",
    "c",
    "c_sharp",
    "vue",
    "lua",
    "html",
    "css",
    "scss",
    "tsx",
    "markdown",
    "markdown_inline",
    "rust",
    "powershell",
    "regex",
    "sql",
    "toml",
    "xml",
    "yaml",
    "zig",
    "python",
    "php",
    "luadoc",
    "go",
    "gitignore",
    "git_config",
    "dockerfile",
    "csv",
    "bash",
    "typst",
    "qml", -- qml
    "qmljs", -- qml
    "slint", -- slint
    "devicetree", -- for zmk configurations

    "gdscript", -- godot
    "godot_resource", -- godot
    "gdshader", -- godot
    "d2", -- d2 (diagrams)
  },
  sync_install = true,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".slint" },
  callback = function()
    vim.bo.filetype = "slint"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".d2" },
  callback = function()
    vim.bo.filetype = "d2"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".d2" },
  callback = function()
    vim.bo.filetype = "d2"
  end,
})

-- для всех файлов .bashrc и .bash_profile
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".bashrc", ".bash_profile" },
  callback = function()
    vim.bo.filetype = "bash"
  end,
})

-- text objects
local function select_function_outer()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@function.outer",
    "textobjects"
  )
end

local function select_function_inner()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@function.inner",
    "textobjects"
  )
end

local function select_class_outer()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@class.outer",
    "textobjects"
  )
end

local function select_class_inner()
  require("nvim-treesitter-textobjects.select").select_textobject(
    "@class.inner",
    "textobjects"
  )
end

vim.keymap.set({ "x", "o" }, "af", select_function_outer)
vim.keymap.set({ "x", "o" }, "if", select_function_inner)
vim.keymap.set({ "x", "o" }, "ac", select_class_outer)
vim.keymap.set({ "x", "o" }, "ic", select_class_inner)
