---@class EditConfigModule
local M = {}

local function normalize_path(path)
  return vim.fs.normalize(path)
end

M.origin_dir = normalize_path(vim.fn.getcwd())
M.config_dir = normalize_path(vim.fn.stdpath("config"))

local function has_unsaved_buffers()
  for _, buf_num in ipairs(vim.api.nvim_list_bufs()) do
    if
      vim.api.nvim_buf_is_loaded(buf_num)
      and vim.api.nvim_get_option_value("modified", { buf = buf_num })
    then
      return true
    end
  end
  return false
end

local function get_top_unsaved_buffer()
  for _, buf_num in ipairs(vim.api.nvim_list_bufs()) do
    if
      vim.api.nvim_buf_is_loaded(buf_num)
      and vim.api.nvim_get_option_value("modified", { buf = buf_num })
    then
      return buf_num
    end
  end
  return nil
end

local function edit_config()
  if M.config_dir == M.origin_dir then
    vim.api.nvim_echo({ { "You are in config directory already" } }, false)
    return
  end

  if has_unsaved_buffers() then
    vim.api.nvim_echo({ { "You have unsaved buffers!" } }, false)
    local unsaved_buf = get_top_unsaved_buffer()

    if unsaved_buf ~= nil then
      vim.api.nvim_buf_attach(unsaved_buf, false)
    end

    return
  end

  local target_dir
  local move_msg

  if vim.fs.normalize(vim.fn.getcwd()) == M.config_dir then
    target_dir = M.origin_dir
    move_msg = "Returning to"
  else
    target_dir = M.config_dir
    move_msg = "Editing config"
  end

  vim.cmd("cd " .. vim.fn.fnameescape(target_dir))
  vim.api.nvim_echo({ { move_msg .. " " .. target_dir } }, true)
end

M.register_edit_config_command = function()
  vim.api.nvim_create_user_command("EditNvimConfig", edit_config, {})
end

return M
