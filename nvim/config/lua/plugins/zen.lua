return {
    "folke/zen-mode.nvim",
    keys = {
        {
            "<leader>zz",
            function()
                vim.cmd(":ZenMode")
            end,
            silent = true,
        },
    },
    opts = {
        window = {
            width = 90
        },
        plugins = {
            options = {
                enabled = false,
                laststatus = 2
            },
        }
    }
}
