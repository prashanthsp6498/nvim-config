return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'jiangmiao/auto-pairs'
    use 'vimwiki/vimwiki'
    use 'vim-airline/vim-airline'
    use 'tpope/vim-fugitive'
    use 'junegunn/fzf.vim'
    use 'junegunn/fzf'
    use 'preservim/nerdtree'
    use 'dense-analysis/ale'
    use 'ervandew/supertab'
    use "EdenEast/nightfox.nvim"
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }
    -- lsp servers specific
    use 'OmniSharp/omnisharp-vim'
    use 'mfussenegger/nvim-jdtls'

    -- cmp sources
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- snips
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
end)
