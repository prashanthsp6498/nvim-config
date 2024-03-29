local function setUp()
    -- Set lualine as statusline
    -- See `:help lualine.txt`
    require("lualine").setup({
        options = {
            icons_enabled = false,
            component_separators = "",
            section_separators = "",
        },
    })
end

return {
    "nvim-lualine/lualine.nvim", -- Fancier statusline
    config = function ()
        setUp()
    end
}
