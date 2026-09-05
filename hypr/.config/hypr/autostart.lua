hl.on("hyprland.start", function()
  -- Extra autostart processes
  -- hl.exec_cmd("uwsm-app -- my-service")
  -- hl.exec_cmd("uwsm-app -- hypridle")
  hl.exec_cmd("uwsm-app -- hyprsunset ")
  hl.exec_cmd("uwsm-app -- mako")
  -- hl.exec_cmd("uwsm-app -- waybar")
  -- hl.exec_cmd("uwsm-app -- wpaperd")
  -- hl.exec_cmd("uwsm-app -- swayosd-server")
  hl.exec_cmd("uwsm-app -- qs -c minsh")
  hl.exec_cmd("walker --gapplication-service")
  hl.exec_cmd("systemctl --user restart walker")
  -- hl.exec_cmd("systemctl --user restart elephant")
  -- hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  -- Slow app launch fix -- set systemd vars
  -- hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
  -- hl.exec_cmd("dbus-update-activation-environment --systemd --all")

  -- other
  -- hl.exec_cmd("systemctl start zapret_discord_youtube.service")
  -- hl.exec_cmd("uwsm-app -- localsend_app --hidden")
end)
