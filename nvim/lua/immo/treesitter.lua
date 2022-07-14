local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = "all",
    ignore_install = {""},
    highlight = {
        enable = true
    },
    autopairs = {
        enable = true
    },
    indent = {
        enable = true
    }
}

