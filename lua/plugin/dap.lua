
vim.keymap.set("n", "<leader>db", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<M-o>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<M-i>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<M-O>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
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

    local dap_laungauge_config = require("plugin.dap.dap_language_config")

    dap_laungauge_config.SetUp()

end

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            config = function()
                require("dapui").setup()
            end,
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                require("nvim-dap-virtual-text").setup()
            end,
        },
        {
            "nvim-telescope/telescope-dap.nvim",
            config = function()
                require("telescope").load_extension("dap")
            end,
        },
    },
    config = configuration,
}
