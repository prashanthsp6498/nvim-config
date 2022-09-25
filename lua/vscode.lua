local api = vim.api;

function normalModeMap(key, mapKey)
    local options = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', key, mapKey, options)
end

-- Debugger
normalModeMap('<leader>e', ":call VSCodeNotify('workbench.action.toggleBreakpoint')<CR>")

-- Editor 
normalModeMap('<leader>e', ":call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
normalModeMap("<leader>l", ":call VSCodeNotify('workbench.action.nextEditor')<CR>")
normalModeMap("<leader>h", ":call VSCodeNotify('workbench.action.previousEditor')<CR>")
normalModeMap("<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>")
normalModeMap("<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>")


-- File and Code
normalModeMap("<leader>rs", ":call VSCodeNotify('editor.action.rename')<CR>")
normalModeMap("<leader>rf", ":call VSCodeNotify('renameFile')<CR>")
normalModeMap("<leader>f", ":call VSCodeNotify('revealInExplorer')<CR>")
