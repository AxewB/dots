vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local function lsp_status()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 }) -- 0 = текущий буфер
  if not buf_clients or vim.tbl_isempty(buf_clients) then
    -- return "(_ _  ) . . z Z"
    return ""
  end

  local names = {}
  for _, client in ipairs(buf_clients) do
    table.insert(names, client.name)
  end

  -- return "/ᐠ-˕-マ " .. table.concat(names, ", ")
  return table.concat(names, ", ")
end

local function word_counter()
  local words = vim.fn.wordcount()["words"]
  return "Words: " .. words
end

-- Define the conditional function to check filetypes
local function word_counter_filetypes()
  local ft = vim.opt_local.filetype:get()
  local allowed_filetypes = {
    markdown = true,
    text = true,
    tex = true,
    vimwiki = true,
    -- Add any other filetypes you want here
  }
  return allowed_filetypes[ft] ~= nil
end

local function show_cwd()
  local custom_delimeter = "  "

  local path = vim.fn.expand("%:.")

  -- if oil buffer
  if string.find(path, "oil") then
    local raw_path = vim.fn.expand("%:p")
    local clean_path = raw_path:gsub("oil://", "")
    local relative_path = vim.fn.fnamemodify(clean_path, ":.")
    path = relative_path
    path = "" .. path:gsub("/$", "") -- removing `/` in the end of the line
  end

  -- if terminal (fzf uses it)
  if string.find(path, "term") then
    path = ""
  end

  if #path > 0 and string.sub(path, 1, 1) == "/" then
    path = string.sub(path, 2)
  end

  local fancy_path = string.gsub(path, "/", custom_delimeter)
  return fancy_path
end

local mode_map = {
  ["NORMAL"] = "N",
  ["O-PENDING"] = "N?",
  ["INSERT"] = "I",
  ["VISUAL"] = "V",
  ["V-BLOCK"] = "VB",
  ["V-LINE"] = "VL",
  ["V-REPLACE"] = "VR",
  ["REPLACE"] = "R",
  ["COMMAND"] = "!",
  ["SHELL"] = "SH",
  ["TERMINAL"] = "T",
  ["EX"] = "X",
  ["S-BLOCK"] = "SB",
  ["S-LINE"] = "SL",
  ["SELECT"] = "S",
  ["CONFIRM"] = "Y?",
  ["MORE"] = "M",
}

local function mode_fmt(mode)
  return mode_map[mode] or mode
end

require("lualine").setup({
  options = {
    -- theme = "palenight",
    theme = "auto",
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },

    -- section_separators = { left = "", right = "" },
    -- █
  },

  sections = {
    lualine_a = {
      { "mode", fmt = mode_fmt },
    },

    lualine_b = { lsp_status, "diagnostics" },
    lualine_c = { show_cwd },
    lualine_x = { "searchcount", "selectioncount" },
    lualine_y = {
      {
        word_counter,
        cond = word_counter_filetypes,
      },
    },
    lualine_z = { "progress", "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { "branch", "diff", lsp_status, "diagnostics" },
    lualine_c = { show_cwd },
    lualine_x = { "searchcount", "selectioncount" },
    lualine_y = {
      {
        word_counter,
        cond = word_counter_filetypes,
      },
    },
  },
  tabline = {},
  extensions = {},
  winbar = {},
})
