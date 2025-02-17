return {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    conf = function(_, opts)
        vim.keymap.set("n", "<leader>tt", ":TodoTelescope", { silent = true })
        vim.keymap.set("n", "<leader>td", ":TodoTelescope keywords=TODO", { silent = true })
        vim.keymap.set("n", "<leader>tb", ":TodoTelescope keywords=BUG", { silent = true })
        vim.keymap.set("n", "<leader>th", ":TodoTelescope keywords=HACK", { silent = true })
        vim.keymap.set("n", "<leader>tn", ":TodoTelescope keywords=NOTE,INFO", { silent = true })
        vim.keymap.set("n", "<leader>tw", ":TodoTelescope keywords=WARN", { silent = true })
        vim.keymap.set("n", "<leader>ts", ":TodoTelescope keywords=TEST", { silent = true })
        require("todo-comments").setup(opts)
    end,
    opts = {
        signs = true,
        keywords = {
            BUG = {
                icon = " ",
                color = "error",
            },
            TODO = {
                icon = " ",
                color = "info"
            },
            HACK = {
                icon = " ",
                color = "warning"
            },
            WARN = {
                icon = " ",
                color = "warning",
            },
            PERF = {
                icon = " ",
            },
            NOTE = {
                icon = " ",
                color = "hint",
                alt = {
                    "INFO"
                }
            },
            TEST = {
                icon = "⏲ ",
                color = "test",
            },
        },
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            pattern = [[\b(KEYWORDS):]],
        },
    }
}
