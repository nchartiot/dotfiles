-- Extra autostart processes.

hl.on("hyprland.start", function()
  -- ───────────────────────────────────────────────
  -- System daemons
  -- ───────────────────────────────────────────────
  hl.exec_cmd("uwsm app -- hypridle")
  hl.exec_cmd("uwsm app -- swaync")
  -- hl.exec_cmd("uwsm app -- fcitx5")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

  -- ───────────────────────────────────────────────
  -- UI / shell
  -- ───────────────────────────────────────────────
  hl.exec_cmd("qs -c noctalia-shell")
  hl.exec_cmd("vicinae server")

  -- ───────────────────────────────────────────────
  -- Lock screen
  -- ───────────────────────────────────────────────
  hl.exec_cmd("hyprlock --immediate-render --grace 0")
end)
