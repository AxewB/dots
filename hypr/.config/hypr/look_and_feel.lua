local colors = require("colors")
hl.env("XCURSOR_THEME", "rose-pine-cursor")
hl.env("XCURSOR_SIZE", 32)
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", 32)
hl.env("GTK_CURSOR_THEME", "rose-pine-cursor")
hl.env("GTK_CURSOR_SIZE", 32)

hl.on("hyprland.start", function()
  hl.exec_cmd("hyprctl setcursor rose-pine-hyprcursor 32")
end)

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },

  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
  },

  general = {

    gaps_in = 4,
    gaps_out = 8,
    border_size = 1,

    -- gaps_in = 0,
    -- gaps_out = 0,
    -- border_size = 2,

    col = {
      inactive_border = colors.BASE00,
      active_border = colors.BASE07,
    },

    resize_on_border = true,

    allow_tearing = false,

    -- snap {
    --   enabled = true,
    --   window_gap = 10,
    --   monitor_gap = 10,
    --   respect_gaps = true,
    -- }

    -- layout = scrolling
  },
})

-- Smart gaps
local smart_gap = 4
local enable_smart_gaps = false

if enable_smart_gaps then
  hl.workspace_rule({
    workspace = "w[tv1]",
    gaps_out = smart_gap,
    gaps_in = smart_gap,
  })
  hl.workspace_rule({
    workspace = "f[1]",
    gaps_out = smart_gap,
    gaps_in = smart_gap,
  })
  hl.window_rule({
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
  })
  hl.window_rule({
    match = { float = false, workspace = "w[tv1]" },
    rounding = 0,
  })
  hl.window_rule({
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
  })
  hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })
end

hl.config({
  decoration = {
    rounding = 0,

    blur = {
      enabled = false,
      size = 4,
      passes = 2,
    },
  },
  misc = {
    disable_hyprland_logo = true,
    background_color = colors.BASE00,
    animate_manual_resizes = true,
    animate_mouse_windowdragging = true,
    focus_on_activate = false,
    middle_click_paste = false,
  },

  cursor = {
    no_hardware_cursors = 1,
    zoom_factor = 1,
    zoom_disable_aa = true,
    -- persistent_warps = true,
    -- warp_on_change_workspace = 1,
    zoom_rigid = false,
    zoom_detached_camera = false,
    -- warp_back_after_non_mouse_input = true,
    enable_hyprcursor = true,
  },
})

hl.curve(
  "expressiveFastSpatial",
  { type = "bezier", points = { { 0.42, 1.67 }, { 0.21, 0.90 } } }
)
hl.curve(
  "expressiveSlowSpatial",
  { type = "bezier", points = { { 0.39, 1.29 }, { 0.35, 0.98 } } }
)
hl.curve(
  "expressiveDefaultSpatial",
  { type = "bezier", points = { { 0.38, 1.21 }, { 0.22, 1.00 } } }
)
hl.curve(
  "emphasizedDecel",
  { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } }
)
hl.curve(
  "emphasizedAccel",
  { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } }
)
hl.curve("standardDecel", { type = "bezier", points = { { 0, 0 }, { 0, 1 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve(
  "menu_accel",
  { type = "bezier", points = { { 0.52, 0.03 }, { 0.72, 0.08 } } }
)
hl.curve("stall", { type = "bezier", points = { { 1, -0.1 }, { 0.7, 0.85 } } })

hl.animation({ leaf = "global", enabled = false })

local enabled_animations = false

hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 0.1,
  bezier = "emphasizedDecel",
  style = "popin 94%",
})
hl.animation({
  leaf = "fadeIn",
  enabled = true,
  speed = 0.1,
  bezier = "emphasizedDecel",
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 0.1,
  bezier = "emphasizedDecel",
  style = "popin 94%",
})
hl.animation({
  leaf = "fadeOut",
  enabled = true,
  speed = 0.1,
  bezier = "emphasizedDecel",
})
hl.animation({
  leaf = "windowsMove",
  enabled = enabled_animations,
  speed = 2,
  bezier = "emphasizedDecel",
  style = "slide",
})
hl.animation({
  leaf = "border",
  enabled = enabled_animations,
  speed = 2,
  bezier = "emphasizedDecel",
})
hl.animation({
  leaf = "layersIn",
  enabled = enabled_animations,
  speed = 2.0,
  bezier = "emphasizedDecel",
  style = "popin 96%",
})
hl.animation({
  leaf = "layersOut",
  enabled = enabled_animations,
  speed = 1.8,
  bezier = "menu_accel",
  style = "popin 94%",
})
hl.animation({
  leaf = "fadeLayersIn",
  enabled = enabled_animations,
  speed = 0.4,
  bezier = "menu_decel",
})
hl.animation({
  leaf = "fadeLayersOut",
  enabled = enabled_animations,
  speed = 2.0,
  bezier = "stall",
})
hl.animation({
  leaf = "workspaces",
  enabled = enabled_animations,
  speed = 5,
  bezier = "menu_decel",
  style = "slidefade",
})
hl.animation({
  leaf = "specialWorkspaceIn",
  enabled = enabled_animations,
  speed = 2.8,
  bezier = "emphasizedDecel",
  style = "slidevert",
})
hl.animation({
  leaf = "specialWorkspaceOut",
  enabled = enabled_animations,
  speed = 1.2,
  bezier = "emphasizedAccel",
  style = "slidevert",
})
hl.animation({
  leaf = "zoomFactor",
  enabled = enabled_animations,
  speed = 3,
  bezier = "emphasizedDecel",
})
