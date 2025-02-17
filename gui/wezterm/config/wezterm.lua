local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.audible_bell = "Disabled"

config.font = wezterm.font('Iosevka Nerd Font Mono')
config.font_size = 12
config.line_height = 0.9
config.harfbuzz_features = { 'calt=0' }

config.color_scheme = 'MaterialDarker'

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_padding = {
    left = 0,
    right = 0,
    bottom = 0,
    top = 0,
}

return config
