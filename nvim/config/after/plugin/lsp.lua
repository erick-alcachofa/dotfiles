local lspconfig = require('lspconfig')
local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local neodev = require('neodev')

neodev.setup({
    override = function(_, library)
        library.enabled = true
        library.runtime = true
        library.types = true
        library.plugins = true
    end
})

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

lsp.ensure_installed({
    'bashls',
    'cmake',
    'cssls',
    'golangci_lint_ls',
    'html',
    'jsonls',
    'tsserver',
    'lua_ls',
    'pyright',
    'rust_analyzer',
    'taplo',
    'yamlls',
    'zls',
    'gradle_ls',
    'jdtls',
    'markdown_oxide',
})

lspconfig.html.setup({})
lspconfig.cmake.setup({})
lspconfig.taplo.setup({})
lspconfig.cssls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.bashls.setup({})
lspconfig.jsonls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.golangci_lint_ls.setup({})
lspconfig.gradle_ls.setup({})
lspconfig.jdtls.setup({})
lspconfig.markdown_oxide.setup({})
lspconfig.zls.setup({})

vim.g.zig_fmt_autosave = false

lspconfig.yamlls.setup({
    settings = {
        yaml = { keyOrdering = false }
    }
})

lspconfig.lua_ls.setup({
    settings = {
        lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

lspconfig.clangd.setup({
    cmd = {
        'clangd',
        '--query-driver="g++,gcc"',
        '--header-insertion=never'
    }
})
require("clangd_extensions").setup()

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Up>'] = cmp.mapping.select_prev_item({
        behavior = cmp.SelectBehavior.Insert
    }),
    ['<Down>'] = cmp.mapping.select_next_item({
        behavior = cmp.SelectBehavior.Insert
    }),
    ['<C-y>'] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace
    }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" }),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = 'Normal:Normal,NormalFloat:None,FloatBorder:Normal,CursorLine:Visual,Search:None',
    },
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 70,
            before = function(entry, vim_item)
                vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    ultisnips = "[UltiSnips]",
                    nvim_lua = "[Lua]",
                    cmp_tabnine = "[TabNine]",
                    look = "[Look]",
                    path = "[Path]",
                    spell = "[Spell]",
                    calc = "[Calc]",
                    emoji = "[Emoji]"
                })[entry.source.name]

                return vim_item
            end
        })
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set({ 'n', 'i' }, '<A-f>', function()
        vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<leader>fd', function()
        require('telescope.builtin').diagnostics()
    end, opts)
end)

lsp.nvim_workspace()

lsp.setup()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        prefix = "◉",
        spacing = 2
    },
})
