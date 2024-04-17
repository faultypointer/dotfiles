local wezterm = require 'wezterm'

local config = wezterm.config_builder()


config.color_scheme = 'Gruvbox (Gogh)'

config.font = wezterm.font 'JetBrains Mono'
config.default_prog = { 'zsh' }


return config
