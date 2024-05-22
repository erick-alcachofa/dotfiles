local theme_path = vim.fn.stdpath('config') .. '/lua/alcachofa/colorschemes/current.lua'

local function SetTheme(theme)
    local _themes = {
        ['monokai-pro'] = function()
            require('monokai-pro').setup(require('alcachofa.colorschemes.monokai-pro'))
            vim.cmd.colorscheme("monokai-pro")
        end,
        ['kanagawa'] = function()
            require('kanagawa').setup(require('alcachofa.colorschemes.kanagawa'))
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
        ['gruvbox'] = function()
            require('alcachofa.colorschemes.gruvbox').setup()
        end,
        ['nordfox'] = function()
            require('nightfox').setup(require('alcachofa.colorschemes.nordfox'))
            vim.cmd.colorscheme("nordfox")
        end,
    }

    if _themes[theme] == nil then
        theme = 'nordfox'
    end

    _themes[theme]()
end

vim.api.nvim_create_user_command(
    "SetTheme",
    function(opts)
        local theme = opts.fargs[1]

        if theme == nil then
            error("Theme required")
        end

        local f = require("io").open(theme_path, "w")

        if f then
            f:write(theme)
            f:close()
        else
            error(vim.fn.stdpath('config'))
        end

        SetTheme(theme)
    end,
    {
        nargs = 1,
        desc = "ArtiWs",
        complete = function(_, _)
            return {
                "monokai-pro",
                "kanagawa",
                "gruvbox",
                "nordfox"
            }
        end
    }
)

local ok, theme = pcall(loadfile, theme_path)

SetTheme((function()
    if ok and theme ~= nil then
        local ret = theme()
        if ret ~= nil and ret.value ~= nil then
            return ret.value
        end
    end

    return nil
end)())
