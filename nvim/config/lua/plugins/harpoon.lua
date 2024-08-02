return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            ["harpoon_files"] = {
                add = function(possible_value)
                    local Path = require("plenary.path")

                    local function normalize_path(buf_name, root)
                        return Path:new(buf_name):make_relative(root)
                    end

                    local value = possible_value.value or normalize_path(
                        vim.api.nvim_buf_get_name(
                            vim.api.nvim_get_current_buf()
                        ),
                        vim.loop.cwd()
                    )

                    return {
                        value = value,
                        context = possible_value.context or { }
                    }
                end,

            }
        })

        local conf = require("telescope.config").values

        local function toggle_telescope(harpoon_files)
            local file_paths = {}

            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table {
                    results = file_paths
                },
                previewer = conf.file_previewer {},
                sorter = conf.generic_sorter {}
            }):find()
        end

        vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end)

        vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)

        vim.keymap.set("n", "<leader>hk", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<leader>hj", function() harpoon:list():next() end)

        vim.keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>he", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>hr", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>ht", function() harpoon:list():select(5) end)
    end
}
