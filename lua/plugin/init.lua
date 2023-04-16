return {
    "hrsh7th/cmp-nvim-lua",
    "norcalli/nvim-colorizer.lua",
    "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
    "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "nvim-treesitter/playground",

    -- Git related plugins
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    -- undotree
    "mbbill/undotree",

    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    },


}
