return {
    options = {
        transparent = false,
        styles = {
            keywords = "bold",
            comments = "italic",
        },
        inverse = {
            match_paren = true,
        },
    },
    groups = {
        all = {
            Conceal = {
                fg = "palette.comment"
            },
            -- Normal = {
            --     bg = "none",
            --     ctermbg = "none"
            -- },
            -- NormalFloat = {
            --     bg = "none",
            --     ctermbg = "none"
            -- },
            -- FloatBorder = {
            --     bg = "none",
            --     ctermbg = "none"
            -- },
            -- FloatTitle = {
            --     bg = "none",
            --     ctermbg = "none"
            -- },
            TelescopeTitle = {
                fg = "palette.pink.bright",
                bg = "palette.bg2",
            },
            TelescopePromptNormal = {
                bg = "palette.bg3",
            },
            TelescopePromptBorder = {
                fg = "palette.bg3",
                bg = "none",
            },
            TelescopeResultsNormal = {
                bg = "palette.bg2",
            },
            TelescopeResultsBorder = {
                fg = "palette.bg2",
                bg = "none",
            },
            TelescopePreviewNormal = {
                bg = "#192330",
            },
            TelescopePreviewBorder = {
                fg = "#192330",
                bg = "none",
            },
        }
    }
}
