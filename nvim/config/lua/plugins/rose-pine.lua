return {
    "rose-pine/nvim",
    name = "rose-pine",
    config = function(plugin, opts)
        require("rose-pine").setup(opts)
        vim.cmd.colorscheme("rose-pine")
    end,
    opts = {
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
            terminal = false,
            legacy_highlights = false,
            migrations = true,
        },

        styles = {
            bold = true,
            italic = true,
            transparency = true
        },

        groups = {
            border = "muted",
            link = "iris",
            panel = "surface",

            error = "love",
            hint = "iris",
            info = "foam",
            note = "pine",
            todo = "rose",
            warn = "gold",

            git_add = "foam",
            git_change = "rose",
            git_delete = "love",
            git_dirty = "rose",
            git_ignore = "muted",
            git_merge = "iris",
            git_rename = "pine",
            git_stage = "iris",
            git_text = "rose",
            git_untracked = "subtle",

            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
        },

        highlight_groups = {
            Comment = {
                fg = "foam"
            },
            VertSplit = {
                fg = "muted",
                bg = "muted"
            },
            TelescopeTitle = {
                fg = "rose",
                bg = "overlay"
            },
            TelescopePromptNormal = {
                bg = "surface"
            },
            TelescopePromptBorder = {
                fg = "surface",
                bg = "none"
            },
            TelescopeResultsNormal = {
                bg = "overlay",
            },
            TelescopeResultsBorder = {
                fg = "overlay",
                bg = "none"
            },
            TelescopePreviewNormal = {
                bg = "#21202e"
            },
            TelescopePreviewBorder = {
                fg = "#21202e",
                bg = "none"
            },
            TelescopeSelection = {
                bg = "base"
            }
        },

        before_highlight = function(group, highlight, palette)
        end,
    }
}
