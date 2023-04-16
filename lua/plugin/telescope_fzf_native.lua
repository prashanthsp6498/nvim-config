return {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
    config = function ()
        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")
    end

}
