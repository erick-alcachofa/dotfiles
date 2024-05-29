local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local config = require('telescope.config')

local vimgrep_args = { unpack(config.values.vimgrep_arguments) }
table.insert(vimgrep_args, '--follow')
table.insert(vimgrep_args, '--hidden')
table.insert(vimgrep_args, '--trim')
table.insert(vimgrep_args, '--no-ignore')
table.insert(vimgrep_args, '--glob')
table.insert(vimgrep_args, '!**/.git/*')
table.insert(vimgrep_args, "--glob")
table.insert(vimgrep_args, "!**/.cache/*")
table.insert(vimgrep_args, "--glob")
table.insert(vimgrep_args, "!**/.idea/*")
table.insert(vimgrep_args, "--glob")
table.insert(vimgrep_args, "!**/.vim/*")
table.insert(vimgrep_args, "--glob")
table.insert(vimgrep_args, "!**/build*/*")

require('telescope').setup({
    defaults = {
        vimgrep_arguments = vimgrep_args,

        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        prompt_prefix = "   ",
        selection_caret = "  ",

        border = true,
        borderchars = { "▄", "▌", "▀", "▐", "▗", "▖", "▘", "▝" },

        file_ignore_patterns = { "node_modules" },
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
        preview = {
            mime_hook = function(filepath, bufnr, opts)
                local is_image = function(filepath)
                    local image_extensions = { 'png', 'jpg' } -- Supported image formats
                    local split_path = vim.split(filepath:lower(), '.', { plain = true })
                    local extension = split_path[#split_path]
                    return vim.tbl_contains(image_extensions, extension)
                end

                if is_image(filepath) then
                    local term = vim.api.nvim_open_term(bufnr, {})

                    local function send_output(_, data, _)
                        for _, d in ipairs(data) do
                            vim.api.nvim_chan_send(term, d .. '\r\n')
                        end
                    end

                    vim.fn.jobstart(
                        { 'chafa', '--format=symbols', '--symbols=all', '--colors=full', filepath },
                        { on_stdout = send_output, stdout_buffered = true, pty = true }
                    )
                else
                    require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid,
                        "Binary cannot be previewed")
                end
            end
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
            find_command = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--trim",
                "--files",
                "--hidden",
                "--no-ignore",
                "--glob",
                "!**/.git/*",
                "--glob",
                "!**/.cache/*",
                "--glob",
                "!**/.idea/*",
                "--glob",
                "!**/.vim/*",
                "--glob",
                "!**/build*/*",
                "--glob",
                "!**/zig-cache/*",
                "--glob",
                "!**/zig-out/*",
            }
        }
    }
})


vim.keymap.set("n", "<leader>fs", function() builtin.current_buffer_fuzzy_find() end, { silent = true })
vim.keymap.set("n", "<leader>fg", function() builtin.live_grep() end, { silent = true })
vim.keymap.set("n", "<leader>ff", function() builtin.find_files() end, { silent = true })
vim.keymap.set("n", "<leader>fb", function() builtin.buffers() end, { silent = true })
vim.keymap.set("n", "<leader>fr", function() builtin.resume() end, { silent = true })
