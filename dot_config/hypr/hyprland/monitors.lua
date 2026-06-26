-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and resolutions possible: hyprctl monitors
-- Format: output, mode, position, scale

-- ───────────────────────────────────────────────
-- HiDPI scaling
-- ───────────────────────────────────────────────
hl.env("GDK_SCALE", "2")

-- ───────────────────────────────────────────────
-- Default monitor configuration
-- ───────────────────────────────────────────────
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})
