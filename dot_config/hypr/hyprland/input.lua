-- Control your input devices.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

-- ───────────────────────────────────────────────
-- Keyboard & touchpad settings
-- ───────────────────────────────────────────────
hl.config({
  input = {
    repeat_rate = 40,
    repeat_delay = 600,

    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.3,
    },
  },
})
