local get_ivy_theme_config = function()
    return require("telescope.themes").get_ivy({})
end

local get_builtin = require("telescope.builtin")
local theme_ivy = function(opts) return require("telescope.themes").get_ivy(opts) end

local lsp_reference = function() get_builtin.lsp_references(theme_ivy({ show_line = false })) end

local current_buff_fuzzy = function() require("telescope.builtin").current_buffer_fuzzy_find({ show_line = false }) end

local find_files = function() get_builtin.find_files(theme_ivy({follow=true})) end

local live_grep = function()
    get_builtin.live_grep(theme_ivy({
        additional_args = {
            "--follow",
            "--ignore-case"
        },
        glob_pattern = {
            "!*.asset", "!*.prefab", "!*.png", "!*.wav",
            "!*.unity", "!*.scene", "!*.meta", "!*.mat",
            "!*.shader", "!*.anim", "!*.dll", "!*.bk2"
        }
    }))
end

local opts = {
    defaults = {
        path_display = { "smart" },
        dynamic_preview_title = true,
        file_ignore_patters = {
            "%.png", "%.PNG", "%.meta", "%bk2",
            "%.wav", "%.anim", "%.dll", "%.strm",
            "%.spriteatlas", "%.controller", "%.cba",
            "%.mat", "%.psd", "%.prefab", "%.asset",
            "%.unity",
        }
    },
    pickers = {
        find_files = {
            theme = "ivy"
        },
        live_grep = {
            theme = "ivy"
        },
        builtin = {
            theme = "ivy"
        },
    },
    pickers = {
        find_files = {
            find_command = { 'rg', '--files', '-g', '!.git' },
        },
    },
}


require("telescope").setup(opts)
pcall(require("telescope").load_extension, "fzf")

-- keymaps
vim.keymap.set("n", "<leader>ff", find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>sw", "<Cmd>Telescope grep_string<CR>", { desc = "[S]earch Current [W]ord" })
vim.keymap.set("n", "<leader>sg", live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", "<Cmd>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader><sapce>t", "<Cmd>Telescope<CR>", { desc = "[T]elescope" })
vim.keymap.set("n", "<leader>gr", lsp_reference, { desc = "List References" })
vim.keymap.set("n", "<leader>/", current_buff_fuzzy, { desc = "Current buffer fuzzy find" })
