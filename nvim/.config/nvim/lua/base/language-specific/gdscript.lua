vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "gdscript" },
  callback = function()
    local projectfile = vim.fn.getcwd() .. "/project.godot"

    if projectfile then
      vim.fn.serverstart("./godothost")
    end
  end,
})
