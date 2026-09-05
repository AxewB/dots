local TRPL = "SUPER + ALT + CTRL"

require("bindings.general")
require("bindings.applications")
require("bindings.windows")
require("bindings.workspaces")
--
-- # bindd = $TRPL, L, Toggle window split, togglesplit, # dwindle
-- # bindd = SUPER SHIFT, P, Pseudo, pseudo
--
--
-- # Toggle floating, center and set size to 800x600
-- bind = SUPER,  W, exec,                     hyprctl --batch "dispatch togglefloating; dispatch resizeactive exact 800 600; dispatch centerwindow"
hl.bind(
  "SUPER + F",
  hl.dsp.window.fullscreen(),
  { description = "Toggle window fullscreen" }
)
--
-- ###-###
-- ### MENUS
-- ### ###
--
-- # bindd = SUPER, SPACE, Launch application launcher, global, minsh:open-apps-provider
hl.bind(
  "SUPER + SPACE",
  hl.dsp.exec_cmd("walker"),
  { description = "Launch application launcher" }
)
hl.bind(
  "SUPER + M",
  hl.dsp.exec_cmd("elephant m minsh-main-menu"),
  { description = "Launch menu" }
)
hl.bind(
  "SUPER + SLASH",
  hl.dsp.exec_cmd("elephant m minsh-module-hyprland_bindings"),
  { description = "Keybinds cheatsheet" }
)
-- # bindd = SUPER, COMMA, Emoji picker, exec, walker -m symbols
--
-- ###-###
-- ### CLIPBOARD
-- ### ###
--
hl.bind(
  "SUPER + C",
  hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert" }),
  { description = "Universal copy" }
)
hl.bind(
  "SUPER + V",
  hl.dsp.send_shortcut({ mods = "SHIFT", key = "Insert" }),
  { description = "Universal paste" }
)
hl.bind(
  "SUPER + X",
  hl.dsp.send_shortcut({ mods = "CTRL", key = "X" }),
  { description = "Universal cut" }
)
hl.bind(
  "SUPER + CTRL + V",
  hl.dsp.exec_cmd("elephant m clipboard"),
  { description = "Clipboard manager" }
)
--
-- # # Captures
hl.bind(
  "Print",
  -- hl.dsp.exec_cmd("minsh-screenshot -m window"),
  hl.dsp.exec_cmd("hyprshot -m region"),
  { description = "Take screenshot" }
)
hl.bind(
  "ALT + Print",
  hl.dsp.exec_cmd("hyprshot -m region -z"),
  { description = "Take screenshot (frozen)" }
)
--
-- # Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(
  "SUPER + mouse:272",
  hl.dsp.window.drag(),
  { description = "Move window", mouse = true }
)
hl.bind(
  "SUPER + mouse:273",
  hl.dsp.window.resize(),
  { description = "Resize window", mouse = true }
)
-- hl.bind("SUPER + SHIFT + mouse:273", resizewindow 1, {description = "Resize window (lock aspect ratio)", mouse = true})
--
-- ###-###
-- ### MEDIA
-- ### ###
--
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ --limit 1.0"),
  { description = "Volume up" }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
  { description = "Volume down" }
)
hl.bind(
  "ALT + XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.5%+ --limit 1.0"),
  { description = "Volume up" }
)
hl.bind(
  "ALT + XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.5%-"),
  { description = "Volume down" }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { description = "Mute" }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { description = "Mute microphone" }
)
--
-- # Requires playerctl
hl.bind(
  "XF86AudioNext",
  hl.dsp.exec_cmd("playerctl next"),
  { description = "Next track" }
)
hl.bind(
  "XF86AudioPause",
  hl.dsp.exec_cmd("playerctl play-pause"),
  { description = "Pause" }
)
hl.bind(
  "XF86AudioPlay",
  hl.dsp.exec_cmd("playerctl play-pause"),
  { description = "Play" }
)
hl.bind(
  "XF86AudioPrev",
  hl.dsp.exec_cmd("playerctl previous"),
  { description = "Previous track" }
)
--
-- # Rewind and fast forward
hl.bind(
  "XF86AudioForward",
  hl.dsp.exec_cmd("playerctl position 5+"),
  { description = "Fast Forward media" }
)
hl.bind(
  "XF86AudioRewind",
  hl.dsp.exec_cmd("playerctl position 5-"),
  { description = "Rewind media" }
)
--
-- # Switch audio output with Super + Mute
-- # bindld = SUPER, XF86AudioMute, Switch audio output, exec, omarchy-cmd-audio-switch
