local function keyMapSetup()
    vim.api.nvim_set_keymap("n","<leader>bp", ":BufferLinePick<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", { noremap = true, silent = true })

end

return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({})
        keyMapSetup()
    end,
}
