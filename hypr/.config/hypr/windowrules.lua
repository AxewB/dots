hl.window_rule({
  name = "floating-tui-window",
  float = true,
  center = true,
  size = { 1200, 800 },
  match = {
    class = "minsh.floating.*|.*localsend.*",
  },
})

hl.window_rule({
  name = "chromium-based-browser-wr",
  match = {
    class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)",
  },
  tag = "+chromium-based-browser",
})

hl.window_rule({
  name = "firefox-based-browser-wr",
  match = {
    class = "(.*(fF)irefox.*|.*zen.*|.*librewolf.*)",
  },

  tag = "+firefox-based-browser",
})

hl.window_rule({
  name = "browser-opacity",
  opacity = "1 0.97",
  tag = "firefox-based-browser",
})

hl.window_rule({
  name = "no_transparency_for_video_sites",
  opacity = "1.0 1.0",
  match = {
    title = "(?i).*(\byoutube\b|\btwitch\b|\btelegram\b).*",
  },
})

hl.window_rule({
  name = "minsh-shadow",
  no_anim = false,
  match = {
    namespace = "minsh",
  },
})

hl.window_rule({
  name = "bambulab_on_5th_workspace",
  workspace = 5,

  match = {
    class = "BambuStudio",
  },
})

-- Layer rules

hl.layer_rule({
  name = "disable_animations_hyprshot",
  no_anim = true,
  match = {
    title = "hyprshot|walker|rofi",
  },
})
