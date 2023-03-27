function ColorBackground(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    local hightlights =
        { "Normal", "NormalFloat", "NormalNC", "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal" }

    for _, val in pairs(hightlights) do
        vim.api.nvim_set_hl(0, val, { bg = "none" })
    end
end

ColorBackground()
