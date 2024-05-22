return {
    transparent_background = false,
    devicons = true,
    styles = {
        comment = {
            italic = true
        },
        keyword = {
            italic = false,
            bold = true,
        },
        type = {
            italic = false,
            bold = true,
        },
        storageclass = {
            italic = false,
            bold = true,
        },
        structure = {
            italic = false,
            bold = true,
        },
        parameter = {
            italic = false,
            bold = false,
        },
        annotation = {
            italic = false,
            bold = true,
        },
        tag_attribute = {
            italic = false,
            bold = true,
        },
    },
    filter = "spectrum",
    override = function(c)
        return {
            Conceal = {
                fg = c.base.dimmed5
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
            TelescopeSelection = {
                bg = c.base.black
            },
            TelescopeTitle = {
                fg = c.base.yellow,
                bg = c.base.black,
            },
            TelescopePromptNormal = {
                bg = c.base.dimmed4,
                fg = c.base.yellow
            },
            TelescopePromptBorder = {
                fg = c.base.dimmed4,
                bg = "none",
            },
            TelescopeResultsNormal = {
                bg = c.base.dimmed5,
            },
            TelescopeResultsBorder = {
                fg = c.base.dimmed5,
                bg = "none",
            },
            TelescopePreviewNormal = {
                bg = c.base.black,
            },
            TelescopePreviewBorder = {
                fg = c.base.black,
                bg = "none",
            },

            -- NvimTreeNormal = {
            --     bg = "none",
            -- },
            -- NvimTreeEndOfBuffer = {
            --     bg = "none",
            -- },
        }
    end
}
