-- Turn on lsp status information
require("fidget").setup()

-- Setup neovim lua configuration
require("neodev").setup()

-- Enable Comment.nvim
require("Comment").setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require("indent_blankline").setup({
    char = "┊",
    show_trailing_blankline_indent = false,
})
