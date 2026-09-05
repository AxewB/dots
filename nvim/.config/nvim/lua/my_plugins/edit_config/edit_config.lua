-- main module file
local module = require("my_plugins.edit_config.module")

---@class EditConfigPlugin
local M = {}

M.setup = function()
  module.register_edit_config_command()
end

return M
