-- plugin: fzf-lua
vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
  -- deps
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- optional icons dependency
})

require("fzf-lua").setup({
  fzf_colors = {
    ["fg"] = { "fg", "Normal" },
    ["bg"] = { "bg", "Normal" },
    ["hl"] = { "fg", "Comment" },
    ["fg+"] = { "fg", "CursorLine", "bold" },
    ["prompt"] = { "fg", "Normal" },
    ["pointer"] = { "fg", "Function" },
    ["marker"] = { "fg", "Constant" },
    ["spinner"] = { "fg", "PreProc" },
    ["header"] = { "fg", "Comment" },
  },
  files = {
    fd_opts = "--type f --hidden"
      .. " --exclude .git"
      .. " --exclude node_modules"
      .. " --exclude .venv"
      .. " --exclude .log"
      .. " --exclude @girs"
      .. " --exclude .build"
      .. " --exclude .cache",
    silent = true,
  },

  winopts = {
    -- split = "belowright new",
    border = "solid",
    fullscreen = false,

    preview = {
      -- default = "bat",
      border = "solid",

      layout = "flex",
      vertical = "down:50%", -- по умолчанию для узких
      horizontal = "right:40%", -- для широких
      flip_columns = 60,


      winopts = {
        number = true,
        relativenumber = false,
        cursorline = true,
        cursorlineopt = "both",
        cursorcolumn = false,
        signcolumn = "no",
        list = false,
        foldenable = false,
        foldmethod = "manual",
      },
      scrollbar = false,
    },
  },

  actions = {
    files = {
      ["enter"] = FzfLua.actions.file_edit,
      ["ctrl-l"] = FzfLua.actions.file_edit,

      ["ctrl-i"] = FzfLua.actions.toggle_ignore,
      ["ctrl-h"] = FzfLua.actions.toggle_hidden,
      ["ctrl-f"] = FzfLua.actions.toggle_follow,

      ["alt-q"] = FzfLua.actions.file_sel_to_qf,
      ["alt-s"] = FzfLua.actions.file_split,
      ["alt-v"] = FzfLua.actions.file_vsplit,
    },
  },
  grep = {
    rg_opts = "--color=never --hidden --follow -g '!.git' -g '!node_modules' -g '!.venv' -g '!*.log'",
    silent = true,
  },
  lsp = {
    silent = true,
  },
})

-- Adding fzf todo search only if plugin exists
local function show_todos(whole_project)
  whole_project = whole_project or false

  local cmd = "TodoFzfLua"
  if whole_project then
    cmd = cmd .. " keywords=TODO,FIX,FIXME"
  end

  local ok = pcall(vim.cmd, cmd)
  if not ok then
    vim.notify(
      "todo-comments plugin either is not loaded",
      vim.log.levels.WARN,
      {}
    )
    return
  end
end

local fzf = require("fzf-lua")

fzf.register_ui_select()

-- stylua: ignore start
vim.keymap.set("n", "<leader>f", function() fzf.files() end,                 { desc = "fzf-lua find files" })
vim.keymap.set("n", "<leader>g", function() fzf.live_grep() end,             { desc = "fzf-lua live grep" })
-- vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end,               { desc = "fzf-lua buffers" })
-- vim.keymap.set("n", "<leader>fh", function() fzf.help_tags() end,             { desc = "fzf-lua help tags" })
vim.keymap.set("n", "<leader>c", function() fzf.commands() end,              { desc = "fzf-lua commands" })
-- vim.keymap.set("n", "<leader>fq", function() fzf.quickfix() end,              { desc = "fzf-lua quickfix" })
vim.keymap.set("n", "<leader>k", function() fzf.keymaps() end,               { desc = "fzf-lua keymaps" })
vim.keymap.set("n", "<leader>t", function() show_todos() end,                { desc = "fzf-lua keymaps" })
vim.keymap.set("n", "<leader>T", function() show_todos(true) end,            { desc = "fzf-lua keymaps" })
vim.keymap.set("n", "<leader>d", function() fzf.diagnostics_document() end,  { desc = "FzfLua Workspace Diagnostics" })
vim.keymap.set("n", "<leader>D", function() fzf.diagnostics_workspace() end, { desc = "FzfLua Buffer Diagnostics" })
-- stylua: ignore end

-- LSP keymaps when lsp attached
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set("n", "<leader>ca", function()
      fzf.lsp_code_actions()
    end, { desc = "FzfLua Buffer Diagnostics" })
  end,
})

-- nvim colors
-- vim.g.fzf_colors = {
--   fg = { 'fg', 'Normal' },
--   bg = { '-1', 'NormalFloat' },
--   hl = { 'fg', 'Constant' },
--   ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'ColorColumn', 'qfCursorLine' },
--   ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn', 'ColorColumn', 'qfCursorLine' },
--   ['hl+'] = { 'fg', 'Identifier' },
--   info = { 'fg', 'PreProc' },
--   border = { 'fg', 'Comment' },
--   prompt = { 'fg', 'Conditional' },
--   pointer = { 'fg', 'Exception' },
--   marker = { 'fg', 'Keyword' },
--   spinner = { 'fg', 'Label' },
--   header = { 'fg', 'Type' },
-- }
