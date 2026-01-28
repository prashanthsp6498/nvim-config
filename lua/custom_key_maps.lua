local M = {}

M.SetMake = function ()
    print()
    local fileType = vim.api.nvim_buf_get_option(0, 'filetype')

    local filetype_comp_map_table = {}

    filetype_comp_map_table.python = "python3 %"
    filetype_comp_map_table.cpp = "g++ % -o exec.out && ./exec.out"
    filetype_comp_map_table.c = "gcc % -o exec.out && ./exec.out"
    filetype_comp_map_table.rust = "cargo build"
    filetype_comp_map_table.lua = "cargo build"

    print(fileType)

    local buf = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_option(buf, "makeprg", filetype_comp_map_table[fileType])

    vim.keymap.set("n", "<leader>r", ":make <CR>")

end

M.compile = function()
    vim.ui.input({
        prompt = "Compile : ",
        default = vim.bo.makeprg,
        completion="shellcmd"
    }, function(input)
        input = input:gsub("^%s+", "")
        input = input:gsub("%s+$", "")
        vim.bo.makeprg = input
    end)
end

return M
