---@class MoveFileWithFzf
local M = {}

local plugin_name = "MoveFileWithFzf"

-- TODO: добавить конфиг для hidden и exclude

M.exclude = {}
M.show_hidden = {}

local function get_current_buf_path()
  return vim.api.nvim_buf_get_name(0)
end

local function file_exists(fpath)
  return vim.uv.fs_stat(fpath)
end

local function move_file_callback(cur_filepath, target_dir)
  local absolute_path = vim.fn.fnamemodify(target_dir, ":p")
  local file_basename = vim.fs.basename(cur_filepath)
  local target_filepath = vim.fs.joinpath(absolute_path, file_basename)

  if file_exists(target_filepath) then
    vim.api.nvim_echo({ { "File exists!", "ErrorMsg" } }, true, {})
    return
  end

  vim.api.nvim_cmd({ cmd = "saveas", args = { target_filepath } }) -- save with new path and switch buffer

  local ok, err = vim.uv.fs_unlink(cur_filepath)

  if not ok then
    vim.api.nvim_echo({ { "Error while deleting old file: ", "ErrorMsg" } }, true, {})
    return
  end

  vim.api.nvim_echo(
    { { "Move file to " .. target_dir .. "/" .. file_basename } },
    false
  )
end

local function move_file()
  local cur_filepath = get_current_buf_path()

  if cur_filepath == "" then
    vim.api.nvim_echo({ { "Save current buffer first before moving" } }, false, {})
    return
  end

  local cwd = vim.fs.normalize(vim.fn.getcwd())
  local cur_dir = vim.fs.normalize(vim.fs.dirname(cur_filepath))

  local directories = {}
  local cwd_dirs = vim.fn.systemlist("fd --type d --hidden --exclude .git")

  if cur_dir ~= cwd then
    table.insert(directories, ".")
  end

  for _, dir in ipairs(cwd_dirs) do
    local norm_dir = vim.fs.normalize(dir)
    local abs_dir = vim.fs.joinpath(cwd, norm_dir)

    if cur_dir ~= abs_dir then
      table.insert(directories, norm_dir)
    end
  end

  require("fzf-lua").fzf_exec(directories, {
    prompt = "Directories > ",
    actions = {
      ["default"] = function(selected)
        local target_dir = selected[1]

        if target_dir == "." then
          target_dir = cwd
        else
          target_dir = vim.fs.joinpath(cwd, target_dir)
        end

        move_file_callback(cur_filepath, target_dir)
      end,
    },
  })
end

M.register_move_file_command = function()
  vim.api.nvim_create_user_command(
    "MoveFileWithFzf",
    move_file,
    { desc = "Move file using FZF as directory picker" }
  )
end

return M
