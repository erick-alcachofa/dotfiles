return {
    "Bekaboo/deadcolumn.nvim",
    opts = {
        scope = "visible",

        modes = function()
            return true
        end,

        blending = {
            threshold = 1,
            colorcode = "c4a7e7",
        },

        warning = {
            alpha = 0,
            offset = 0,
        }
    }
}
