local colors = require("colors")

if hl.plugin.hyprbars ~= nil then
  hl.config({
    plugin = {
      hyprbars = {
        enabled = true,

        bar_height = 24,
        bar_color = colors.BASE01,
        bar_text_size = 8,
        bar_text_font = "CaskaydiaCove Nerd Font",
        bar_button_padding = 8,
        bar_padding = 8,
        bar_part_of_window = true,

        col = {
          text = colors.BASE05,
        },

        icon_on_hover = false,
        bar_precedence_over_border = false,
        on_double_click = "hyprctl dispatch togglefloating",
      },
    },
  })

  hl.plugin.hyprbars.add_button({
    bg_color = colors.BASE08,
    size = 12,
    action = "hyprctl dispatch killactive",
  })
  hl.plugin.hyprbars.add_button({
    bg_color = colors.BASE0A,
    size = 12,
    action = "hyprctl dispatch fullscreen 2",
  })
  hl.plugin.hyprbars.add_button({
    bg_color = colors.BASE0B,
    size = 12,
    action = "hyprctl dispatch togglefloating",
  })
end

if hl.plugin["dynamic-cursors"] ~= nil then
  hl.config({
    plugin = {
      ["dynamic-cursors"] = {

        enabled = true,
        mode = "none", -- rotate | tilt | stretch

        shake = {
          threshold = 5.0,
          limit = 6.0,
          timeout = 1000,
          effects = 1, -- rotate | tilt | stretch: 1,
        },
      },
    },
  })
end
