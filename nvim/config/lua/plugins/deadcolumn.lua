return {
    "Bekaboo/deadcolumn.nvim",
    lazy = false,
    opts = {
        scope = "visible",

        modes = function()
            return true
        end,

        blending = {
            threshold = 1,
        },
    }
}
