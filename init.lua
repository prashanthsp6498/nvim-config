if vim.g.vscode then
    require("vscode")
else
    require("pluginconfig.plugins")
    require("lsp.lsp-config")
    require("pluginconfig.compe-completion")
end
