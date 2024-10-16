local function setup()
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
end

return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        setup()
    end,
}
