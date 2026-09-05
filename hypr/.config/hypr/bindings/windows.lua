local directions = {
  { home_row_key = "H", direction = "left" },
  { home_row_key = "J", direction = "down" },
  { home_row_key = "K", direction = "up" },
  { home_row_key = "L", direction = "right" },
}

-- Windows actions
for i, value in pairs(directions) do
  -- Select windows
  hl.bind(
    "SUPER + " .. value.home_row_key,
    hl.dsp.focus({ direction = value.direction }),
    { description = "Move focus " .. value.direction }
  )

  -- # Swap windows with SUPER + arrow keys
  hl.bind(
    "SUPER + " .. value.direction,
    hl.dsp.window.swap({ direction = value.direction }),
    { description = "Swap window to the " .. value.direction }
  )
end

-- # Cycle through applications on active workspace
hl.bind(
  "ALT + TAB",
  hl.dsp.window.cycle_next({ next = true }),
  { description = "Cycle to next window" }
)
hl.bind(
  "ALT + SHIFT + TAB",
  hl.dsp.window.cycle_next({ next = false }),
  { description = "Cycle to prev window" }
)
hl.bind(
  "ALT + TAB",
  hl.dsp.window.bring_to_top(),
  { description = "Reveal active window on top" }
)
hl.bind(
  "ALT + SHIFT + TAB",
  hl.dsp.window.bring_to_top(),
  { description = "Reveal active window on top" }
)

-- # Resize active window
hl.bind(
  "SUPER + code:20",
  hl.dsp.window.resize({ x = -100, y = 0, relative = true }),
  { description = "Expand window left (`-` key)" }
)
hl.bind(
  "SUPER + code:21",
  hl.dsp.window.resize({ x = 100, y = 0, relative = true }),
  { description = "Shrink window left (`=` key)" }
)
hl.bind(
  "SUPER + SHIFT + code:20",
  hl.dsp.window.resize({ x = 0, y = -100, relative = true }),
  { description = "Shrink window up" }
)
hl.bind(
  "SUPER + SHIFT + code:21",
  hl.dsp.window.resize({ x = 0, y = 100, relative = true }),
  { description = "Expand window down" }
)

-- # Resize column in scrolling layout
hl.bind(
  "SUPER + period",
  hl.dsp.layout("colresize +0.1"),
  { description = "Resize window right in scrolling layout" }
)
hl.bind(
  "SUPER + comma",
  hl.dsp.layout("colresize -0.1"),
  { description = "Resize window right in scrolling layout" }
)

-- pin
hl.bind("SUPER + P", hl.dsp.window.pin(), { description = "Pin window" })

-- Toggle floating, center and set size to 800x600
local function toggle_floating()
  local w = hl.get_active_window()

  hl.dispatch(hl.dsp.window.float({ action = "toggle", window = w }))

  local monitor = hl.get_active_monitor()
  if monitor ~= nil then
    local resize_to_y = monitor.height / 1.5
    local resize_to_x = monitor.width / 1.5
    hl.dispatch(
      hl.dsp.window.resize({ x = resize_to_x, y = resize_to_y, window = w })
    )
  end
  hl.dispatch(hl.dsp.window.center({ window = w }))
end

hl.bind(
  "SUPER + W",
  toggle_floating,
  -- hl.dsp.window.resize({ width = 800, height = 600, x = 0, y = 0 })
  -- hl.dsp.window.center()
  { description = "Toggle floating, center and set size" }
)
