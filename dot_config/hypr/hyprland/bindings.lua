local terminal = "uwsm app -- ghostty"
local browser = "uwsm app -- zen-browser"
local webapp = "uwsm app -- chromium --new-window --ozone-platform=wayland --app"

-- ───────────────────────────────────────────────
-- Apps & system shortcuts
-- ───────────────────────────────────────────────
hl.bind("SUPER + return", hl.dsp.exec_cmd(terminal), { description = "Terminal" })
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal .. " -e btop"), { description = "Activity" })
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"), { description = "Lock" })
hl.bind("PRINT", hl.dsp.exec_cmd("wayfreeze & sleep 0.1 && grimblast copy area; pkill wayfreeze"),
  { description = "Screenshot region to clipboard" })
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"), { description = "Show notifications" })

-- ───────────────────────────────────────────────
-- Menus & pickers
-- ───────────────────────────────────────────────
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("vicinae toggle"), { description = "Launch apps" })
hl.bind("SUPER + C", hl.dsp.exec_cmd("vicinae 'vicinae://launch/clipboard/history?toggle=true'"),
  { description = "Clipboard history" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("vicinae 'vicinae://launch/core/search-emojis?toggle=true'"),
  { description = "Emoji picker" })

-- ───────────────────────────────────────────────
-- Window management
-- ───────────────────────────────────────────────
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen(), { description = "Fullscreen" })
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind("SUPER + P", hl.dsp.window.pseudo(), { description = "Pseudo window" })

-- ───────────────────────────────────────────────
-- Focus & tiling control
-- ───────────────────────────────────────────────
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }), { description = "Move focus left" })
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus right" })
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }), { description = "Move focus up" })
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }), { description = "Move focus down" })

hl.bind("SUPER + SHIFT + left", hl.dsp.window.swap({ direction = "left" }), { description = "Swap window to the left" })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.swap({ direction = "right" }),
  { description = "Swap window to the right" })
hl.bind("SUPER + SHIFT + up", hl.dsp.window.swap({ direction = "up" }), { description = "Swap window up" })
hl.bind("SUPER + SHIFT + down", hl.dsp.window.swap({ direction = "down" }), { description = "Swap window down" })

hl.bind("ALT + Tab", function() hl.dispatch("cyclenext") end, { description = "Cycle to next window" })
hl.bind("ALT + SHIFT + Tab", function() hl.dispatch("cyclenext prev") end, { description = "Cycle to prev window" })
hl.bind("ALT + Tab", function() hl.dispatch("bringactivetotop") end, { description = "Reveal active window on top" })
hl.bind("ALT + SHIFT + Tab", function() hl.dispatch("bringactivetotop") end,
  { description = "Reveal active window on top" })

-- ───────────────────────────────────────────────
-- Resize active window
-- ───────────────────────────────────────────────
hl.bind("SUPER + code:20", function() hl.dispatch("resizeactive -100 0") end, { description = "Expand window left" })
hl.bind("SUPER + code:21", function() hl.dispatch("resizeactive 100 0") end, { description = "Shrink window left" })
hl.bind("SUPER + SHIFT + code:20", function() hl.dispatch("resizeactive 0 -100") end,
  { description = "Shrink window up" })
hl.bind("SUPER + SHIFT + code:21", function() hl.dispatch("resizeactive 0 100") end,
  { description = "Expand window down" })

-- ───────────────────────────────────────────────
-- Mouse controls
-- ───────────────────────────────────────────────
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- ───────────────────────────────────────────────
-- Workspaces
-- ───────────────────────────────────────────────
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "previous" }))

-- ───────────────────────────────────────────────
-- Media controls
-- ───────────────────────────────────────────────
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true, description = "Volume up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true, description = "Volume down" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true, description = "Mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true, description = "Mute microphone" })

hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 1%+"),
  { locked = true, repeating = true, description = "Volume up precise" })
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
  { locked = true, repeating = true, description = "Volume down precise" })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Pause" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous track" })

-- ───────────────────────────────────────────────
-- Display & brightness
-- ───────────────────────────────────────────────
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"),
  { locked = true, repeating = true, description = "Brightness up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"),
  { locked = true, repeating = true, description = "Brightness down" })

hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"),
  { locked = true, repeating = true, description = "Brightness up precise" })
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"),
  { locked = true, repeating = true, description = "Brightness down precise" })

-- ───────────────────────────────────────────────
-- Input method switching
-- ───────────────────────────────────────────────
hl.bind("CTRL + SHIFT + SHIFT", hl.dsp.exec_cmd("fcitx5-remote -t"), { description = "Switch keyboard layout" })

-- ───────────────────────────────────────────────
-- Lid switch
-- ───────────────────────────────────────────────
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprlock --grace 0"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock --grace 0"), { locked = true })
