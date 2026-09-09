for i = 0, 9 do
  local keycode = 10 + i
  local ws = i + 1

  -- # Switch workspaces with SUPER + [1-9; 0]
  hl.bind(
    "SUPER + code:" .. keycode,
    hl.dsp.focus({ workspace = ws }),
    { description = "Switch to workspace " .. ws }
  )

  -- # Move active window to a workspace with SUPER + SHIFT + [1-9; 0]
  hl.bind(
    "SUPER + SHIFT + code:" .. keycode,
    hl.dsp.window.move({ workspace = ws }),
    { description = "Move window to workspace " .. ws }
  )
  -- Move active window silently to a workspace with SUPER + SHIFT + ALT + [1-9; 0]
  hl.bind(
    "SUPER + ALT + code:" .. keycode,
    hl.dsp.window.move({ workspace = ws, silent = true }),
    { description = "Move window silently to workspace " .. ws }
  )
end

-- # Move workspaces to other monitors
-- hl.bind("$TRPL + LEFT", movecurrentworkspacetomonitor, l, {description = "Move workspace to left monitor"})
-- hl.bind("$TRPL + RIGHT", movecurrentworkspacetomonitor, r, {description = "Move workspace to right monitor"})
-- hl.bind("$TRPL + UP", movecurrentworkspacetomonitor, u, {description = "Move workspace to up monitor"})
-- hl.bind("$TRPL + DOWN", movecurrentworkspacetomonitor, d, {description = "Move workspace to down monitor"})
