return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function(_, opts)
        require("flutter-tools").setup(opts)
        local utility = require("lsp_utility")
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                utility.on_attach(nil, args.buf)
            end,
        })

    end,
}
