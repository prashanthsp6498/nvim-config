local treesitter_opts = function() 
    return {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { "c", "cpp", "lua", "python", "rust", "javascript", "typescript", "markdown" },
        highlight = { enable = true },
        indent = { enable = true, disable = { "python" } },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<c-space>",
                node_incremental = "<c-space>",
                scope_incremental = "<c-s>",
                node_decremental = "<c-backspace>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["<leader>oa"] = "@assignment.inner",
                    ["<leader>oA"] = "@assignment.outer",
                    ["<leader>ia"] = "@assignment.lhs",
                    ["<leader>aa"] = "@assignment.rhs",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        },
    }

end

return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "LspAttach",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter",
                event = "LspAttach",
                run = function()
                    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
                end,
                config = function ()
                    require("nvim-treesitter.configs").setup(treesitter_opts())
                end
            }
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "LspAttach",
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            },
        },
    }
