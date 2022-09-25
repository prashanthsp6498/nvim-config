return require('packer').startup(function(use)
    
    use 'jiangmiao/auto-pairs'
    use 'vimwiki/vimwiki'
    use 'vim-airline/vim-airline'
    use 'tpope/vim-fugitive'
    use 'junegunn/fzf.vim'
    use 'junegunn/fzf'
    use 'preservim/nerdtree'
    use 'OmniSharp/omnisharp-vim'
    use 'dense-analysis/ale'
    use 'neoclide/coc.nvim'
    use 'ervandew/supertab'

end)
