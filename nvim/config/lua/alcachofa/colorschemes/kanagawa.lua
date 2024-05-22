return {
    transparent = true,
    keywordStyle = {
        italic = false,
        bold = true,
    },
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    -- transparent = true,
    terminalColors = true,
    overrides = function(colors)
        local theme = colors.theme
        return {
            Normal = {
                bg = "none",
                ctermbg = "none"
            },
            NormalFloat = {
                bg = "none",
                ctermbg = "none"
            },
            FloatBorder = {
                bg = "none",
                ctermbg = "none"
            },
            FloatTitle = {
                bg = "none",
                ctermbg = "none"
            },
            FloatermBorder = {
                bg = "none",
                fg = theme.ui.fg_dim,
                ctermbg = "none",
            },
            TelescopeTitle = {
                fg = theme.ui.special,
                bold = true
            },
            TelescopePromptNormal = {
                bg = theme.ui.bg_p1
            },
            TelescopePromptBorder = {
                fg = theme.ui.bg_p1,
                bg = theme.ui.bg_p1
            },
            TelescopeResultsNormal = {
                fg = theme.ui.fg_dim,
                bg = theme.ui.bg_m1
            },
            TelescopeResultsBorder = {
                fg = theme.ui.bg_m1,
                bg = theme.ui.bg_m1
            },
            TelescopePreviewNormal = {
                bg = theme.ui.bg_dim
            },
            TelescopePreviewBorder = {
                bg = theme.ui.bg_dim,
                fg = theme.ui.bg_dim
            },
        }
    end
}
