local dap = require('dap')
local dapui = require('dapui')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/opt/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}

dap.configurations.cpp = {
    {
        name = "launch",
        type = "cppdbg",
        request = "launch",
        program = function()
            return coroutine.create(function(coro)
                local pickers = require("telescope.pickers")
                local finders = require("telescope.finders")
                local conf = require("telescope.config").values
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")

                local opts = {

                }
                pickers
                    .new(opts, {
                        prompt_title = "Executable",
                        finder = finders.new_oneshot_job(
                            {
                                "fdfind",
                                "-I",
                                "-L",
                                "-i",
                                "-H",
                                "--strip-cwd-prefix",
                                "-E", ".git",
                                "-t", "x"
                            },
                            {
                                cwd = vim.fn.getcwd()
                            }
                        ),
                        sorter = conf.generic_sorter(opts),
                        attach_mappings = function(buffer_number)
                            actions.select_default:replace(function()
                                actions.close(buffer_number)
                                coroutine.resume(coro, action_state.get_selected_entry()[1])
                            end)
                            return true
                        end,
                    })
                    :find()
            end)
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                description = 'enable pretty printing',
                ignoreFailures = false
            }
        }
    }
}

vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F6>", function() dap.step_over() end)
vim.keymap.set("n", "<F7>", function() dap.step_into() end)
vim.keymap.set("n", "<F8>", function() dap.step_out() end)
vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end)

require('telescope').load_extension('dap')
require('nvim-dap-virtual-text').setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
