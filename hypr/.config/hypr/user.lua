hl.workspace_rule({
  workspace = 6,
  monitor = "DP-2",
  default = true,
  default_name = "6:scnd",
})
hl.workspace_rule({
  workspace = 7,
  monitor = "HDMI-A-1",
  default = true,
  default_name = "7:draw",
})

hl.workspace_rule({ workspace = 1, monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = 2, monitor = "DP-1" })
hl.workspace_rule({ workspace = 3, monitor = "DP-1" })
hl.workspace_rule({ workspace = 4, monitor = "DP-1" })
hl.workspace_rule({ workspace = 5, monitor = "DP-1", layout = "scrolling" })
