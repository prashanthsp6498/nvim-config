return {
    {
        "ggandor/leap.nvim",
        config = function ()
            local leap = require "leap"
            leap.create_default_mappings()
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function ()
            local color = "rose-pine"
            vim.cmd.colorscheme(color)

            local hightlights =
            { "Normal", "NormalFloat", "NormalNC", "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal" }

            for _, val in pairs(hightlights) do
                vim.api.nvim_set_hl(0, val, { bg = "none" })
            end
        end
    },
    {
        "nvim-lualine/lualine.nvim", -- Fancier statusline
        opts = {
            options = {
                icons_enabled = false,
                component_separators = "",
                section_separators = "",
                theme = "base16",
            },
            sections = {
                lualine_a = { { 'mode', fmt = function (res)
                    return res:sub(1, 1)
                end }
                }
            }

        }
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },

        }
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
        },
    },
    {
        "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
        opts = {},
    },
    {
        "nvim-treesitter/playground",
        event = "LspAttach"
    },

    {
        -- Git related plugins
        "tpope/vim-fugitive",
        keys = {
            { "<leader>g", ":G<CR>", desc = "fugitive" },
        },
    },
    {
        -- undotree
        "mbbill/undotree",
        keys = {
            { "<leader>ut", vim.cmd.UndotreeToggle, mode = { "n" }, desc = "Toggle [U]ndo [T]ree" },
        },
    },
}
