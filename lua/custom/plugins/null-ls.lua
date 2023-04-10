-- Linters & formatters
return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- [[ Configuring null_ls ]]
        local null_ls = require('null-ls')

        -- Register any number of sources simultaneously
        local sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.diagnostics.pylint.with({
                extra_args = { '-d',
                    'too-many-lines,missing-module-docstring,missing-class-docstring,missing-function-docstring,import-error' },
                env = { PYTHONPATH = '/home/bjorn/miniconda3/bin/python' }
            }),
        }

        null_ls.setup({ sources = sources })
    end
}
