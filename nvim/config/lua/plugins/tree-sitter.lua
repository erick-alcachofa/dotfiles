return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(plugin, opts)
       require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
        modules = {},
        ignore_install = {},
        auto_install = false,
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "vim",
            "ini",
            "bash",
            "json",
            "make",
            "toml",
            "yaml",
            "cmake",
            "regex",
            "vimdoc",
            "markdown",
            "dockerfile",
            "markdown_inline",
        },
        sync_install = false,
        highlight = {
            enable = true,
            use_languagetree = true,
            additional_vim_regex_highlighting = false
        },
        indent = {
            enable = true
        },
    }
}
