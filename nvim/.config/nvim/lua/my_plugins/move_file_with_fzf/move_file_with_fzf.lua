-- main module file
local module = require("my_plugins.move_file_with_fzf.module")

---@class MoveFileWithFzfPlugin
local M = {}

-- TODO: добавить config

M.setup = function()
  local has_fzf, _ = pcall(require, "fzf-lua")

  if not has_fzf then
    print("fzf-lua pluginis not installed!")
    return
  end

  module.register_move_file_command()
end

return M
