if vim.g.vscode then
    require("vscode")
else
    require("pluginconfig.plugins")
    require("lsp.lsp-config")
    require("pluginconfig.comp-completion")
end
