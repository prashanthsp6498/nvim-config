-- Turn on lsp status information
require("fidget").setup()

-- Setup neovim lua configuration
require("neodev").setup()

-- Enable Comment.nvim
require("Comment").setup()


-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require("ibl").setup({
    indent = {
        char = "┊",
    },
    scope = {
        show_start = true,
        show_end = false,
    },
})

vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
