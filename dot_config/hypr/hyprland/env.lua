-- ───────────────────────────────────────────────
-- Cursor size & theme
-- ───────────────────────────────────────────────
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")

-- ───────────────────────────────────────────────
-- GTK / Qt theming
-- ───────────────────────────────────────────────
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

-- ───────────────────────────────────────────────
-- Force all apps to use Wayland
-- ───────────────────────────────────────────────
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")

-- ───────────────────────────────────────────────
-- Desktop / session identity
-- ───────────────────────────────────────────────
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GTK_USE_PORTAL", "1")

-- ───────────────────────────────────────────────
-- XCompose file
-- ───────────────────────────────────────────────
hl.env("XCOMPOSEFILE", "~/.XCompose")

-- ───────────────────────────────────────────────
-- XWayland scaling
-- ───────────────────────────────────────────────
hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})

-- ───────────────────────────────────────────────
-- Ecosystem options
-- ───────────────────────────────────────────────
hl.config({
  ecosystem = {
    no_update_news = true,
  },
})
