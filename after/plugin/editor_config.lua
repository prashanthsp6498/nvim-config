-- vanila configuration

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.undofile = true
-- vim.opt.undodir = "~/.vim/undodir"

-- Colorscheme
-- vim.cmd("colorscheme carbonfox")

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.opt.shortmess:append("I")

vim.cmd [[ highlight Normal  guibg=#121212 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
           highlight NonText  guibg=#121212 gui=NONE ctermfg=246 ctermbg=235 cterm=NONE ]]

vim.api.nvim_set_keymap("c", "<M-b>", "<S-Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-w>", "<S-Right>", { noremap = true })
vim.keymap.set("v", "<M-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-K>", ":m '<-2<CR>gv=gv")
