-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = { "W391" },
                        maxLineLength = 100,
                    },
                },
            },
        },
    },
    rust_analyzer = {
        single_file_support = true,
    },
    lua_ls = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("lua", true),
            },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT" },
        },
    },
    gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        single_file_support = true,
    },
    html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true,
            },
            provideFormatter = true,
        },
        single_file_support = true,
    },
    csharp_ls = {
        filetypes = "cs",
        cmd = { "csharp-ls" },
        init_options = { AutomaticWorkspaceInit = true },
    },
    clangd = {
        filetypes = {"c", "cpp"}
    },
    zls = {
        filetypes = "zig",
    }
}

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = servers
        },
        config = function (_, opts)
            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                config.on_attach = require("lsp_utility").on_attach
                lspconfig[server].setup(config)
            end
        end,
        dependencies = {
            {
                "Saghen/blink.cmp",
                event = "LspAttach",
                version = 'v0.*',
                opts = {
                    keymap = { preset = "default" },

                    completion = {
                        -- Show documentation when selecting a completion item
                        documentation = { auto_show = true, auto_show_delay_ms = 500 },
                    },
                    snippets = {
                        preset = 'luasnip',
                        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
                        active = function(filter)
                            if filter and filter.direction then
                                return require('luasnip').jumpable(filter.direction)
                            end
                            return require('luasnip').in_snippet()
                        end,
                        jump = function(direction) require('luasnip').jump(direction) end,
                    },
                    sources = {
                        default = { 'lsp', 'buffer', 'snippets', 'path' },
                        -- Optionally disable cmdline completions
                    },
                    signature = {
                        enabled = true,
                        window = {
                            show_documentation = true
                        }
                    }
                },
                opts_extend = { "sources.default" },
                dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' }
            },
            {
                "williamboman/mason.nvim",
                opts = {
                    registries = {
                        "github:mason-org/mason-registry",
                        "github:Crashdummyy/mason-registry",
                    },
                }
            },
            {
                "folke/neodev.nvim",
                opts = {}
            },
            {
                "j-hui/fidget.nvim",
                opts = {}
            },
        }
    },
    {
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                autostart = true,
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.eslint_d,
                    -- null_ls.builtins.completion.spell,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.zigfmt
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = vim.tbl_keys(servers)
        }
    },
}
