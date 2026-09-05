---@class MarkdownShortcutsModule
local M = {}

local plugin_name = "MarkdownShortcuts"

local function check_surrounding_normal(symbol, count)
  count = count or 2

  local target = string.rep(symbol, count)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""

  -- Перед курсором
  local start_left = math.max(1, col - count)
  local end_left = col - 1
  local actual_left = line:sub(start_left, end_left)

  -- После курсора
  local start_right = col + 1
  local end_right = col + count
  local actual_right = line:sub(start_right, end_right)

  local has_left = actual_left == target
  local has_right = actual_right == target

  vim.notify(
    string.format(
      "[Normal] Слева: %s | Справа: %s",
      has_left and "MATCH" or "NO",
      has_right and "MATCH" or "NO"
    )
  )

  return has_left, has_right
end

local function check_surrounding_visual(symbol, count)
  count = count or 2

  local target = string.rep(symbol, count)

  local _, s_row, s_col = unpack(vim.fn.getpos("v"))
  local _, e_row, e_col = unpack(vim.fn.getpos("."))

  -- Нормализуем направление выделения
  if s_row > e_row or (s_row == e_row and s_col > e_col) then
    s_row, s_col, e_row, e_col = e_row, e_col, s_row, s_col
  end

  local start_line = vim.api.nvim_buf_get_lines(0, s_row - 1, s_row, false)[1]
    or ""

  local end_line = vim.api.nvim_buf_get_lines(0, e_row - 1, e_row, false)[1]
    or ""

  -- Перед выделением
  local start_left = math.max(1, s_col - count)
  local end_left = s_col - 1
  local actual_left = start_left <= end_left
      and start_line:sub(start_left, end_left)
    or ""

  -- После выделения
  local start_right = e_col + 1
  local end_right = e_col + count
  local actual_right = end_line:sub(start_right, end_right)

  local has_left = actual_left == target
  local has_right = actual_right == target

  return has_left, has_right
end

local function check_surrounding_insert(count, symbol)
  count = count or 3
  symbol = symbol or " "

  local target = string.rep(symbol, count)

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""

  -- col — позиция курсора между символами.
  -- Lua использует 1-based индексы, поэтому:
  -- слева: col - N ... col - 1
  -- справа: col ... col + N - 1

  local start_left = math.max(1, col - count)
  local end_left = col - 1
  local actual_left = line:sub(start_left, end_left)

  local start_right = col
  local end_right = col + count - 1
  local actual_right = line:sub(start_right, end_right)

  local has_left = actual_left == target
  local has_right = actual_right == target

  return has_left, has_right
end

local function add_surrounding(symbol, count) end

local function remove_surrounding(symbol, count) end

local function make_selection_bald()
  local current_mode = vim.api.nvim_get_mode()

  local is_surrounded

  if current_mode == "n" then
    is_surrounded = check_surrounding_normal()
  elseif current_mode == "v" then
    is_surrounded = check_surrounding_visual()
  elseif current_mode == "i" then
    is_surrounded = check_surrounding_insert()
  end
end

M.register_make_selection_bald = function()
  vim.keymap.set(
    { "n", "v", "i" },
    "<C-b>",
    make_selection_bald,
    { desc = "Make selection bald" }
  )
end

return M
