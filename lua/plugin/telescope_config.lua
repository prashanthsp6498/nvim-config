local get_ivy_theme_config = function ()
    return require("telescope.themes").get_ivy({})
end

-- Fuzzy Finder (files, lsp, etc)
return {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
    config = function ()
        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            config = function()
                vim.keymap.set("n", "<leader>s", "<Plug>PlenaryTestFile")
            end,
        },
        opts = {
            defaults = get_ivy_theme_config(),
            pickers = {
                find_files = {
                    find_command = {'rg', '--files', '-g', '!.git' },
                },
            },
        },
        keys = {
            {"<leader>ff", "<Cmd>Telescope find_files<CR>",  mode = { "n" }, desc = "[F]ind [F]iles"},
            {"<leader>sw", "<Cmd> Telescope grep_string<CR>", mode = { "n" }, desc = "[S]earch Current [W]ord"},
            {"<leader>sg", "<Cmd> Telescope live_grep<CR>", mode = { "n" }, desc = "[S]earch by [G]rep"},
            {"<leader>sd", "<Cmd> Telescope diagnostics<CR>", mode = { "n" }, desc = "[S]earch [D]iagnostics"},
            {"<leader><space>t", "<Cmd> Telescope<CR>", mode = { "n" }, desc = "[T]elescope"},
            {"<leader>gr", function () require("telescope.builtin").lsp_references({show_line=false}) end, mode = { "n" }, desc = "List References"},
            {"<leader>/", function () require("telescope.builtin").current_buffer_fuzzy_find({show_line = false}) end, mode = { "n" }, desc = "Current buffer fuzzy find"},
        }
    }
}
