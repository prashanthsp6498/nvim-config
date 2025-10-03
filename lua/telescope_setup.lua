local get_ivy_theme_config = function()
    return require("telescope.themes").get_ivy({})
end

local lsp_reference = function() require("telescope.builtin").lsp_references({ show_line = false }) end
local current_buff_fuzzy = function() require("telescope.builtin").current_buffer_fuzzy_find({ show_line = false }) end

local opts = {
    defaults = get_ivy_theme_config(),
    pickers = {
        find_files = {
            find_command = { 'rg', '--files', '-g', '!.git' },
        },
    },
}


require("telescope").setup(opts)
pcall(require("telescope").load_extension, "fzf")

-- keymaps
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>sw", "<Cmd>Telescope grep_string<CR>", { desc = "[S]earch Current [W]ord" })
vim.keymap.set("n", "<leader>sg", "<Cmd>Telescope live_grep<CR>", { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", "<Cmd>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader><sapce>t", "<Cmd>Telescope<CR>", { desc = "[T]elescope" })
vim.keymap.set("n", "<leader>gr", lsp_reference, { desc = "List References" })
vim.keymap.set("n", "<leader>/", current_buff_fuzzy, { desc = "Current buffer fuzzy find" })
