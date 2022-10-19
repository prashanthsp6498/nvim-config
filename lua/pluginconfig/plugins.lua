return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'jiangmiao/auto-pairs'
    use 'vimwiki/vimwiki'
    use 'vim-airline/vim-airline'
    use 'tpope/vim-fugitive'
    use 'junegunn/fzf.vim'
    use 'junegunn/fzf'
    use 'preservim/nerdtree'
    use 'OmniSharp/omnisharp-vim'
    use 'dense-analysis/ale'
    use 'ervandew/supertab'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'mfussenegger/nvim-jdtls'
    use "EdenEast/nightfox.nvim"
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }
end)
