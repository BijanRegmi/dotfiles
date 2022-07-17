null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        formatting.prettier.with({ extra_args = { 
            "--no-semi",
            "--tab-width", "4",
            "--arrow-parens", "avoid",
            "--quote-props", "preserve",
            "--use-tabs",
        }})
    }
})
