return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat"
    },
    config = function(_, opts)
        local leap = require("leap")

        for k, v in pairs(opts) do
            leap.opts[k] = v
        end

        leap.add_default_mappings(true)

        vim.keymap.set("n", "s", function()
            require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
        end)
    end
}
