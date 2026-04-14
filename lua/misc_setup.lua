
require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

require('vim._core.ui2').enable({})
require("oil").setup()
vim.keymap.set("n", "-", require("oil").open)
