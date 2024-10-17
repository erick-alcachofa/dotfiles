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

        local view = require('nvim-tree.view')
        local api = require('nvim-tree.api')
        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd

        autocmd({ 'BufEnter', 'QuitPre' }, {
            nested = false,
            callback = function(e)
                local tree = require('nvim-tree.api').tree

                -- Nothing to do if tree is not opened
                if not tree.is_visible() then
                    return
                end

                -- How many focusable windows do we have? (excluding e.g. incline status window)
                local winCount = 0
                for _, winId in ipairs(vim.api.nvim_list_wins()) do
                    if vim.api.nvim_win_get_config(winId).focusable then
                        winCount = winCount + 1
                    end
                end

                -- We want to quit and only one window besides tree is left
                if e.event == 'QuitPre' and winCount == 2 then
                    vim.api.nvim_cmd({ cmd = 'qall' }, {})
                end

                -- :bd was probably issued an only tree window is left
                -- Behave as if tree was closed (see `:h :bd`)
                if e.event == 'BufEnter' and winCount == 1 then
                    -- Required to avoid "Vim:E444: Cannot close last window"
                    vim.defer_fn(function()
                        -- close nvim-tree: will go to the last buffer used before closing
                        tree.toggle({ find_file = true, focus = true })
                        -- re-open nivm-tree
                        tree.toggle({ find_file = true, focus = false })
                    end, 10)
                end
            end
        })


        -- save nvim-tree window width on WinResized event
        augroup('save_nvim_tree_width', { clear = true })
        autocmd('WinResized', {
            group = 'save_nvim_tree_width',
            pattern = '*',
            callback = function()
                local filetree_winnr = view.get_winnr()
                if filetree_winnr ~= nil and vim.tbl_contains(vim.v.event['windows'], filetree_winnr) then
                    vim.t['filetree_width'] = vim.api.nvim_win_get_width(filetree_winnr)
                end
            end,
        })

        -- restore window size when openning nvim-tree
        api.events.subscribe(api.events.Event.TreeOpen, function()
            if vim.t['filetree_width'] ~= nil then
                view.resize(vim.t['filetree_width'])
            end
        end)
    end,
    opts = {
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
