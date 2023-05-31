local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Register any number of sources simultaneously
local sources = {
    formatting.black,
    formatting.prettier,
    diagnostics.chktex,
    diagnostics.pylint.with({
        extra_args = { '-d',
            'too-many-lines,missing-module-docstring,missing-class-docstring,missing-function-docstring,import-error' },
    }),

}

null_ls.setup({
    sources = sources,
    preview = 200,
})
