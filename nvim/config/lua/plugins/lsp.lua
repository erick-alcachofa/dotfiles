return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",

        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
        },

        "williamboman/mason-lspconfig.nvim",

        {
            "j-hui/fidget.nvim",
            opts = { },
        },
        {
            "nvim-java/nvim-java",
            dependencies = {
                "nvim-java/lua-async-await",
                "nvim-java/nvim-java-core",
                "nvim-java/nvim-java-test",
                "nvim-java/nvim-java-dap",
            }
        }
    },

    config = function()
        local lspconfig = require("lspconfig")
        local lsp = require("lsp-zero").preset {}
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        lsp.ensure_installed {
            "zls",
            "html",
            "taplo",
            "jdtls",
            "cssls",
            "bashls",
            "lua_ls",
            "yamlls",
            "jsonls",
            "pyright",
            "ts_ls",
            "gradle_ls",
            "rust_analyzer",
            "markdown_oxide",
            "golangci_lint_ls",
        }

        lspconfig.zls.setup{}
        lspconfig.html.setup{}
        lspconfig.taplo.setup{}
        lspconfig.cssls.setup{}
        lspconfig.bashls.setup{}
        lspconfig.jsonls.setup{}
        lspconfig.pyright.setup{}
        lspconfig.ts_ls.setup{}
        lspconfig.gradle_ls.setup{}
        lspconfig.rust_analyzer.setup{}
        lspconfig.markdown_oxide.setup{}
        lspconfig.golangci_lint_ls.setup{}

        vim.g.zig_fmt_autosave = false

        lspconfig.yamlls.setup{
            settings = {
                yaml = {
                    keyOrdering = false
                }
            }
        }

        lspconfig.lua_ls.setup{
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT"
                    },
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    }
                }
            }
        }

        if os.getenv("NIX_CC") ~= nil then
            lspconfig.clangd.setup{
                cmd = {
                    "clangd",
                    "-header-insertion=never",
                    "--offset-encoding=utf-16",
                    "--query-driver=".. os.getenv("NIX_CC") .. "/bin/g++" ..
                    "," .. os.getenv("NIX_CC") .. "/bin/gcc"
                }
            }
        else
            lspconfig.clangd.setup{
                cmd = {
                    "clangd",
                    "-header-insertion=never",
                    "--offset-encoding=utf-16",
                    "--query-driver=gcc,g++"
                }
            }
        end

        require('java').setup{}
        lspconfig.jdtls.setup{}

        local cmp_mappings = {
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
        }

        lsp.setup_nvim_cmp {
            formatting = {
                fields = {
                    "kind",
                    "abbr",
                    "menu"
                },
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        local kind_icons = {
                            Text = "",
                            Method = "󰆧",
                            Function = "󰊕",
                            Constructor = "",
                            Field = "󰇽",
                            Variable = "󰂡",
                            Class = "󰠱",
                            Interface = "",
                            Module = "",
                            Property = "󰜢",
                            Unit = "",
                            Value = "󰎠",
                            Enum = "",
                            Keyword = "󰌋",
                            Snippet = "",
                            Color = "󰏘",
                            File = "󰈙",
                            Reference = "",
                            Folder = "󰉋",
                            EnumMember = "",
                            Constant = "󰏿",
                            Struct = "",
                            Event = "",
                            Operator = "󰆕",
                            TypeParameter = "󰅲",
                        }

                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

                        vim_item.menu = ({
                            buffer = "[Buff]",
                            nvim_lsp = "[LSP ]",
                            ultisnips = "[Snps]",
                            nvim_lua = "[Lua ]",
                            cmp_tabnine = "[TbNn]",
                            look = "[Look]",
                            path = "[Path]",
                            spell = "[Spll]",
                            calc = "[Calc]",
                            emoji = "[Emji]"
                        })[entry.source.name]

                        return vim_item
                    end
                })
            }
        }

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
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

            vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, opts)

            vim.keymap.set({ 'n', 'i' }, '<A-f>', function()
                vim.lsp.buf.format { async = true }
            end, opts)

            vim.keymap.set('n', '<leader>fd', function()
                require('telescope.builtin').diagnostics()
            end, opts)
        end)

        lsp.nvim_workspace()
        lsp.setup()

        -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        --     border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        -- })

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = "◉",
                spacing = 6
            },
        })
    end
}
