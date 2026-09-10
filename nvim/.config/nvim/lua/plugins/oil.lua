vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
})
require("oil").setup({
  default_file_explorer = true,
  columns = {
    -- "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  delete_to_trash = true,
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  watch_for_changes = true,
  constrain_cursor = "name",
  view_options = {
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  keymaps = {
    ["<leader>e"] = { "actions.close", mode = "n" },
    ["<C-q>"] = { "actions.close", mode = "n" },

    [";"] = { "actions.select", mode = "n" },

    ["g?"] = { "actions.show_help", mode = "n" },
    ["gp"] = "actions.preview",
    ["Q"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",

    ["-"] = { "actions.parent", mode = "n" },
    ["<BS>"] = { "actions.parent", mode = "n" },

    ["_"] = { "actions.open_cwd", mode = "n" },

    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
})

vim.keymap.set(
  "n",
  "<leader>e",
  "<CMD>Oil<CR>",
  { desc = "Open parent directory" }
)
