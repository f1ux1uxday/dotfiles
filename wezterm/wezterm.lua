local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font 'FantasqueSansM Nerd Font'
config.font_size = 10.5
config.enable_tab_bar = false

-- config.window_background_opacity = 0.6
config.color_scheme = 'Gruvbox Material (Gogh)'
config.colors = {
  foreground = '#d4be98'
}

return config
