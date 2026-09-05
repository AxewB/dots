hl.env("GDK_SCALE", 1)

hl.monitor({
  output = "DP-1",
  mode = "1920x1080@144.00",
  position = "0x0",
  scale = 1,
  transform = 0,
  disabled = false,
})

hl.monitor({
  output = "DP-2",
  mode = "1920x1080@144.00",
  position = "0x-1080",
  scale = 1,
  transform = 0,
  disabled = false,
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@60.00",
  position = "0x1080",
  scale = 1,
  disabled = false,
  -- mirror = DP-1,
  -- transform = 2,
})
