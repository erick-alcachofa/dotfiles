local wezterm = require('wezterm')
local act = wezterm.action

local config = wezterm.config_builder()

config.audible_bell = "Disabled"

config.font = wezterm.font('FantasqueSansM Nerd Font Mono')
config.font_size = 12

config.color_scheme = 'Rosé Pine (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_padding = {
    left = '1cell',
    right = '1cell',
    bottom = 0,
    top = 0,
}

config.colors = {
    tab_bar = {
        background = '#232136',
        active_tab = {
            bg_color = '#3E8FB0',
            fg_color = '#E0DEF4',
            intensity = 'Bold',
        },
        inactive_tab = {
            bg_color = '#393552',
            fg_color = '#E0DEF4'
        },
        inactive_tab_hover = {
            bg_color = '#393552',
            fg_color = '#E0DEF4'
        },
        new_tab = {
            bg_color = '#393552',
            fg_color = '#E0DEF4'
        },
        new_tab_hover = {
            bg_color = '#393552',
            fg_color = '#E0DEF4'
        }
    }
}

return config
