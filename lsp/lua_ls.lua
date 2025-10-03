return {
    workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("lua", true),
    },
    telemetry = { enable = false },
    diagnostics = { globals = { "vim" } },
    runtime = { version = "LuaJIT" },
}
