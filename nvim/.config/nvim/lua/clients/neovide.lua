if vim.g.neovide then
  vim.o.guifont = "CaskaydiaMono Nerd Font"
  -- vim.o.guifont = "IosevkaTerm Nerd Font Mono"

  -- floating window blur
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 6.0
  vim.g.neovide_floating_blur_amount_y = 6.0
  -- floatin window shadow
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_floating_corner_radius = 8.0
  vim.g.neovide_confirm_quit = true

  vim.g.neovide_cursor_vfx_mode = {
    -- 'railgun',
    -- 'torpedo',
    "pixiedust",
  }
end
