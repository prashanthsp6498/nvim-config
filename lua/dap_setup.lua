vim.keymap.set("n", "<leader>ds", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<M-o>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<M-i>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<M-O>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.toggle_breakpoint()<CR>")

local function configuration()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    vim.keymap.set("n", "<space>?", function() dapui.eval(nil, { enter = true }) end)
    local dap_laungauge_config = require("plugin.dap.dap_language_config")

    dap_laungauge_config.SetUp()

end

require("dapui").setup()
require("nvim-dap-virtual-text").setup({
    virt_text_pos = "inline"
})
configuration()
