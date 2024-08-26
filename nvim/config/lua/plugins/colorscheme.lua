local colorscheme_path = vim.fn.stdpath('state') .. '/colorscheme'

local function load()
	local file = io.open(colorscheme_path, 'r')

	if not file then
        return nil
    end

    local name = file:read('*l')

    file:close()

    return name
end

local function save(colorscheme)
    local file = io.open(colorscheme_path, 'w+')

    if not file then
        error("Failed to save colorscheme")
    end

    file:write(colorscheme)
    file:flush()
    file:close()
end

local rose_pine = {
    "rose-pine/nvim",
    name = "rose-pine",
    config = function(_, opts)
        vim.opt.background = "dark"
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

local kanagawa = {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function(_, opts)
        vim.opt.background = ""
        require("kanagawa").setup(opts)
        vim.cmd.colorscheme("kanagawa")
    end,
    opts = {
        theme = "wave",
        undercurl = false,
        typeStyle = {},
        functionStyle = {},
        statementStyle = { bold = false },
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = "none"
                    }
                }
            }
        },
        overrides = function(colors)
            local theme = colors.theme

            return {
                TelescopeTitle = { fg = theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
            }
        end,
    }
}

local specs = {
    rose_pine,
    kanagawa
}

vim.api.nvim_create_user_command(
    "Theme",
    function(opts)
        save(opts.args)

        local name = load()

        if name and name ~= '' then
            for _, spec in ipairs(specs) do
                if spec.name == name then
                    spec.config(nil, spec.opts)
                end
            end
        end
    end,
    {
        desc = "Set nvim colorscheme from defined themes",
        nargs = 1,
        complete = function(arglead, cmdline, cursorpos)
            local list = {}

            for _, spec in ipairs(specs) do
                table.insert(list, spec.name)
            end

            return list
        end
    }
)


local name = load()

if name and name ~= '' then
	for _, spec in ipairs(specs) do
		if spec.name == name then
            spec.lazy = false
			spec.priority = 1000
        else
			spec.priority = nil
            spec.lazy = true
		end
	end
end

return specs
