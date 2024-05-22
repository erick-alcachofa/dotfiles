vim.keymap.set("i", "<C-n>", "<Esc>:NvimTreeToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

local options = {
    filters = {
        dotfiles = false
    },
    live_filter = {
        prefix = "[FIND]: ",
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
            quit_on_open = false,
        },
    },
    renderer = {
        root_folder_label = true,
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

require("nvim-tree").setup(options)
