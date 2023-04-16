return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    config = function ()
        require("telescope").load_extension("file_browser")
        vim.keymap.set("n", "<leader>t", ":Telescope file_browser<CR>", { desc = "File Browser" })
    end
}
