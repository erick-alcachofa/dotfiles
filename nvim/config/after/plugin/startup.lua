require("startup").setup({
    header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 0,
        content = {
            "            ████            ",
            "           █    █           ",
            "       ████      ████       ",
            "     ░█    ██████    █░     ",
            "     █    ▒█    ▓▓    █     ",
            "   ████   █      █   ████   ",
            "  █    ██  ██████  ██    █  ",
            " ░█   ▓█   █░   █   █▓   █▒ ",
            "  █   █   █      █   █   █  ",
            "  ████████        ████████  ",
            " █       █        █       █ ",
            " █▒      █        █      ░█ ",
            "  █       █      █░      █  ",
            "   ██      █    █      ██   ",
            "     ▒████████████████▒     ",
            "          █      █          ",
            "           ▒█  █▓           ",
            "           █    █           ",
            "          ▓      █          ",
            "          ████████          ",
        },
        highlight = "",
        default_color = "#289C5C",
        oldfiles_amount = 0,
    },
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 0,
        content = {
            { " Find File", "Telescope find_files",            "<leader>ff" },
            { " New File",  "lua require'startup'.new_file()", "<leader>nf" },
        },
        highlight = "",
        default_color = "#9899d7",
        oldfiles_amount = 0,
    },

    options = {
        after = function()
            require("startup.utils").oldfiles_mappings()
        end,
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 2, 2, 2, 2, 2, 2, 2 },
    },
    colors = {
        background = "None",
        folded_section = "None",
    },
    parts = {
        "header",
        "body",
    }
})
