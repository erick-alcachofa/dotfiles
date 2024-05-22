require('notify').setup({
    background_colour = "#00000000",
    render = "compact",
    stages = "static",
})

require("noice").setup({
    health = { checker = false },
    notify = { enabled = false },
    messages = { enabled = false },
    lsp = {
        signature = { enabled = false },
        progress = { enabled = false },
        message = { enabled = false },
        hover = { enabled = false },
    },
    views = {
        cmdline_popup = {
            position = {
                row = 3,
                col = "50%",
            },
            size = {
                width = 40,
                height = "auto",
            },
        },
        popupmenu = {
            relative = "editor",
            position = {
                row = 6,
                col = "50%",
            },
            size = {
                width = 40,
                height = "auto",
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = {
                    Normal = "Normal",
                    FloatBorder = "DiagnosticInfo"
                }
            }
        }
    }
})
