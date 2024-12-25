return {
    {
        "norcalli/nvim-colorizer.lua",
        opts = { }
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
        main = "ibl",
        opts = {
            indent = {
                char = "┊",
            },
            scope = {
                show_start = true,
                show_end = false,
            },
        }
    },
    {
        "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
        opts = { }
    },
    {
        "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    },
    {
        "nvim-treesitter/playground",
    },

    {
        -- Git related plugins
        "tpope/vim-fugitive",
        keys = {
            {"<leader>g", ":G<CR>", desc = "fugitive" }
        },
    },
    {
        "tpope/vim-rhubarb",
    },
    {
        -- undotree
        "mbbill/undotree",
        keys = {
            { "<leader>ut", vim.cmd.UndotreeToggle, mode = { "n" }, desc = "Toggle [U]ndo [T]ree" },
        }
    }
}
