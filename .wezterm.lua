-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Config
config.font_size = 15.0
config.max_fps = 244
config.animation_fps = 1
config.enable_tab_bar = true
config.enable_scroll_bar = true
config.window_close_confirmation = "NeverPrompt"
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- return the configuration to wezterm
return config
