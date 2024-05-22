local lualine = require('lualine')

lualine.setup({
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
        lualine_c = { 'filename' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
        lualine_b = { 'branch', 'diff' },
        lualine_x = { 'fileformat', 'filetype' },
    }
})
