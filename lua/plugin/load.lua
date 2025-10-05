require("telescope_setup")
require("lsp_setup")

-- load dap, treesitter only when lsp attached otherwise skip
-- which improve loading time of nvim in windows.
-- (No matter how much plugin's, doesn't matter in linux. load time is quick)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        require("treesitter_setup")
        require("dap_setup")
    end
})
