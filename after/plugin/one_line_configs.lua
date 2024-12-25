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
vim.opt.shortmess:append("I")

vim.cmd [[ highlight Normal  guibg=#121212 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
           highlight NonText  guibg=#121212 gui=NONE ctermfg=246 ctermbg=235 cterm=NONE ]]
