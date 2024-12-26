local M = {}

M.SetUp_C_Cpp_Rust = function()
    local dap = require("dap")
    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode-14", -- adjust as needed, must be absolute path
        name = "lldb",
        request = "launch",
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            -- program = dap.adapters.lldb,
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            -- 💀
            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            -- runInTerminal = false,
        },
    }

    -- For rust and c also same above configuration

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

M.SetUp_Python = function()
    local dap = require("dap")
    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch File",
            program = "${file}",
            pythonPath = function()
                return "/usr/bin/python3"
            end,
        },
    }

    dap.adapters.python = {
        type = "executable",
        -- command = "python3",
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python", -- go for mason executable since setup will be done already
        args = { "-m", "debugpy.adapter" },
    }
end

M.SetUp = function()
    M.SetUp_C_Cpp_Rust()
    M.SetUp_Python()
end

return M
