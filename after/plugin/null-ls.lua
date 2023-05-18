local null_ls = require('null-ls')

-- Register any number of sources simultaneously
local sources = {
    null_ls.builtins.diagnostics.chktex,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.pylint.with({
        extra_args = { '-d',
            'too-many-lines,missing-module-docstring,missing-class-docstring,missing-function-docstring,import-error' },
    }),
}

null_ls.setup({
    sources = sources,
    preview = 200,
})
