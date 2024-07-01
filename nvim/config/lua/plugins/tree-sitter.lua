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
            "go",
            "asm",
            "cpp",
            "lua",
            "vim",
            "ini",
            "zig",
            "rust",
            "bash",
            "json",
            "make",
            "toml",
            "yaml",
            "cmake",
            "regex",
            "printf",
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
