local function label(path)
    path = path:gsub(os.getenv 'HOME', '~', 1)
    return path:gsub('([a-zA-Z])[a-z0-9]+', '%1') ..
        (path:match '[a-zA-Z]([a-z0-9]*)$' or '')
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    keys = {
        {
            "<leader>nn",
            function()
                require("nvim-tree.api").tree.toggle()
            end,
            silent = true,
            noremap = true
        }
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
    end,
    opts = {
        filters = {
            dotfiles = false
        },
        live_filter = {
            prefix = " ",
            always_show_folders = false
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = false,
        },
        view = {
            adaptive_size = false,
            side = "left",
            width = 30,
            preserve_window_proportions = true,
        },
        git = {
            enable = true,
            ignore = false,
        },
        filesystem_watchers = {
            enable = false,
        },
        actions = {
            open_file = {
                resize_window = false,
                quit_on_open = false,
            },
        },
        renderer = {
            group_empty = label,
            root_folder_label = label,
            highlight_git = true,
            highlight_opened_files = "none",
            indent_markers = {
                enable = true,
            },
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false,
                },
            },
        },
    }
}
