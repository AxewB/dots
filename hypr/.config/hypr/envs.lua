hl.env("PATH", "$PATH:$HOME/.local/share/minsh/bin")

hl.env("XCURSOR_SIZE", 32)
hl.env("HYPRCURSOR_SIZE", 32)

hl.env("WEBKIT_FORCE_SANDBOX", 0)

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", 1)
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XDG_MENU_PREFIX", "plasma-")

hl.env("XCOMPOSEFILE", "~/.XCompose")

-- NVIDIA environment variables
hl.env("NVD_BACKEND", "direct")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
