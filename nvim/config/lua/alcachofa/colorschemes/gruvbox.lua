local function setup()
    vim.g.gruvbox_material_better_performance = 1

    -- Fonts
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_transparent_background = 0

    -- Themes
    vim.g.gruvbox_material_foreground = 'mix'
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_ui_contrast = 'high'
    vim.g.gruvbox_material_float_style = 'dim'

    local configuration = vim.fn['gruvbox_material#get_configuration']()

    local palette = vim.fn['gruvbox_material#get_palette'](
        configuration.background,
        configuration.foreground,
        configuration.colors_override
    )

    vim.cmd.colorscheme('gruvbox-material')

    local highlights_groups = {
        -- FoldColumn = {
        --     bg = 'none'
        -- },
        -- SignColumn = {
        --     bg = 'none'
        -- },
        -- Normal = {
        --     bg = 'none'
        -- },
        -- NormalNC = {
        --     bg = 'none'
        -- },
        -- NormalFloat = {
        --     bg = 'none'
        -- },
        -- FloatBorder = {
        --     bg = 'none'
        -- },
        -- FloatTitle = {
        --     bg = 'none',
        -- },

        -- FloatermBorder = {
        --     bg = "none",
        --     fg = palette.fg0[1]
        -- },

        Visual = {
            bg = palette.bg_visual_red[1]
        },

        TelescopeTitle = {
            fg = palette.purple[1],
            bold = true
        },
        TelescopePromptNormal = {
            bg = palette.bg3[1]
        },
        TelescopePromptBorder = {
            fg = palette.bg3[1],
            bg = palette.bg3[1]
        },
        TelescopeResultsNormal = {
            fg = palette.fg0[1],
            bg = palette.bg2[1]
        },
        TelescopeResultsBorder = {
            fg = palette.bg2[1],
            bg = palette.bg2[1],
        },
        TelescopePreviewNormal = {
            bg = palette.bg0[1]
        },
        TelescopePreviewBorder = {
            bg = palette.bg0[1],
            fg = palette.bg0[1],
        },
    }

    for hl, col in pairs(highlights_groups) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end

return { setup = setup }
