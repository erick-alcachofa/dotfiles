return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        options = {
            globalstatus = true,
            component_separators = {
                left = '|',
                right = '|'
            },
            section_separators = {
                left = '',
                right = ''
            },
            disabled_filetypes = {
                statusline = { 'NvimTree' }
            },
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    fmt = function(str)
                        return str:sub(1, 1)
                    end
                }
            },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },

            lualine_x = { 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        }
    }
}
