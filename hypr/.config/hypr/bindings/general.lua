hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind(
  "SUPER + F4",
  hl.dsp.window.kill(),
  { description = "Force close window" }
)
hl.bind(
  "SUPER + ALT + CTRL + Delete",
  hl.dsp.exec_cmd(
    "hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
  ),
  { description = "Exit hyprland" }
)
