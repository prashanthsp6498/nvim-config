local blink_opts = {
    keymap = { preset = "default" },

    completion = {
        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
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
    },
    fuzzy = {
        implementation = "lua",
    }
}

require("blink.cmp").setup(blink_opts)

-- setup roslyn
local roslyn_opts = {
    filewatching = "roslyn",
}

require("roslyn").setup(roslyn_opts)
vim.lsp.config("roslyn", {
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true
        }
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local _ = vim.lsp.get_client_by_id(args.data.client_id)
        local curBuf = vim.api.nvim_get_current_buf()
        require("lsp_utility").on_attach(_, curBuf)
    end
})

vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    float = { source = "if_many" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignHint",
        },
    },
})

-- enable everything
vim.lsp.enable("lua_ls")
vim.lsp.enable("pylsp")
vim.lsp.enable("zls")
vim.lsp.enable("roslyn")
