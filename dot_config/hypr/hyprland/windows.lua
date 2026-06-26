-- ───────────────────────────────────────────────
-- Window rules
-- ───────────────────────────────────────────────
hl.window_rule({
  name = "windowrule-1",
  opacity = "1",
  suppress_event = "maximize",
  match = { class = ".*" },
})

hl.window_rule({
  name = "windowrule-2",
  no_focus = true,
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
})

-- Picture-in-Picture
hl.window_rule({
  name = "windowrule-3",
  float = true,
  pin = true,
  size = { 600, 338 },
  keep_aspect_ratio = true,
  border_size = 0,
  opacity = "1 1",
  move = "((monitor_w*1)-window_w-40) ((monitor_h*0.04))",
  match = { tag = "pip" },
})

-- ───────────────────────────────────────────────
-- General appearance
-- ───────────────────────────────────────────────
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 6,
    border_size = 2,

    col = {
      active_border = "rgba(cba6f7ee)",
      inactive_border = "rgba(595959aa)",
    },

    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 8,

    shadow = {
      enabled = true,
      range = 2,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },

    blur = {
      enabled = true,
      size = 8,
      passes = 3,
      noise = 0.02,
      contrast = 1.0,
      brightness = 0.8,
      vibrancy = 0.3,
      vibrancy_darkness = 0.2,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
    force_split = 2,
  },

  master = {
    new_status = "master",
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    focus_on_activate = true,
  },
})

-- ───────────────────────────────────────────────
-- Animation curves
-- ───────────────────────────────────────────────
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- ───────────────────────────────────────────────
-- Animations
-- ───────────────────────────────────────────────
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = false, speed = 0, bezier = "ease" })

-- ───────────────────────────────────────────────
-- Layer rules
-- ───────────────────────────────────────────────
hl.layer_rule({
  name = "vicinae-blur",
  blur = true,
  ignore_alpha = 0.1,
  match = { namespace = "vicinae" },
})

hl.layer_rule({
  name = "vicinae-no-animation",
  no_anim = true,
  match = { namespace = "vicinae" },
})

hl.layer_rule({
  name = "noctalia",
  match = { namespace = "noctalia-background-.*$" },
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
