-- Turn on lsp status information
require('fidget').setup()

-- Setup neovim lua configuration
require('neodev').setup()

-- Setup onedark color themes
require('onedark').setup {
    -- style = 'darker'
    style = 'warmer'
}
require('onedark').load()

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
    char = '┊',
    show_trailing_blankline_indent = false,
}
