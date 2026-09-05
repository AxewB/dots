hl.bind(
  "SUPER + T",
  hl.dsp.exec_cmd(
    'uwsm-app -- xdg-terminal-exec --dir="$(minsh-cmd-terminal-cwd)" --single-instance'
  ),
  { description = "Terminal" }
)
hl.bind(
  "SUPER + ALT + T",
  hl.dsp.exec_cmd("foot"),
  { description = "Terminal" }
)
hl.bind(
  "SUPER + E",
  hl.dsp.exec_cmd("nautilus"),
  { description = "File manager" }
)
hl.bind(
  "SUPER + CTRL + ALT + R",
  hl.dsp.exec_cmd("uwsm-app -- qs -c minsh"),
  { description = "Reload Minsh shell" }
)
