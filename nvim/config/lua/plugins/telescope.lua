return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        {
            "<leader>fs",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find()
            end,
            silent = true,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            silent = true,
        },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            silent = true,
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            silent = true,
        },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").resume()
            end,
            silent = true,
        },
    },
    config = function(plugin, opts)
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local config = require('telescope.config')

        require("telescope").setup {
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "bottom",
                        preview_width = 0.5,
                        results_width = 0.8
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120
                },

                prompt_prefix = "   ",
                selection_caret = "  ",

                border = true,
                borderchars = { "▄", "▌", "▀", "▐", "▗", "▖", "▘", "▝" },

                file_ignore_patterns = { ".git" },

                path_display = { "truncate" },
                color_devicons = true,

                set_env = { ["COLORTERM"] = "truecolor" },

                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                    i = {
                        ["<Esc>"] = actions.close
                    }
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<C-x>"] = actions.delete_buffer + actions.move_to_top,
                        }
                    }
                },
                find_files = {
                    follow = true,
                }
            }
        }
    end
}
