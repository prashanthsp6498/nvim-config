return {
    "norcalli/nvim-colorizer.lua",
    "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
    "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "nvim-treesitter/playground",

    -- Git related plugins
    {
        "tpope/vim-fugitive",
        keys = {
            {"<leader>g", ":G<CR>", desc = "fugitive" }
        },
    },
    "tpope/vim-rhubarb",

    -- undotree
    "mbbill/undotree",
}
