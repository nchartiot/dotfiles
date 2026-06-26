-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/

-- local config_home = (os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")) .. "/hypr"
-- package.path = config_home .. "/?.lua;" .. config_home .. "/?/init.lua;" .. package.path

require("hyprland.monitors")
require("hyprland.input")
require("hyprland.bindings")
require("hyprland.autostart")
require("hyprland.windows")
require("hyprland.env")

require("noctalia.noctalia-colors")
