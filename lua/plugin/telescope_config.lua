local function setUp()
    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                },
            },
        },
    })
end

local function telescopeKeymapper()
    -- See `:help telescope.builtin`
    vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        }))
    end, { desc = "[/] Fuzzily search in current buffer]" })

    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader><space>t", ":Telescope<CR>", { desc = "Telescope" })
    vim.keymap.set(
        "n",
        "<leader>gr",
        function()
            require("telescope.builtin").lsp_references({show_line=false})
        end,
        { desc = "References" })
end

-- Fuzzy Finder (files, lsp, etc)
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        setUp()
        telescopeKeymapper()
    end,
}
