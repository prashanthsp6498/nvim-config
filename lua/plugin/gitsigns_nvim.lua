local function setUp()
    -- Gitsigns
    -- See `:help gitsigns.txt`
    require("gitsigns").setup({
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
    })
end

return {
    "lewis6991/gitsigns.nvim",
    config = function()
        setUp()
    end,
}
