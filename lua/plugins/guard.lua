local config = function()
    local ft = require('guard.filetype')

    -- Assuming you have guard-collection
    ft('python'):fmt('black')
        :lint('pylint')
        :extra({ '-d',
            'too-many-lines,missing-module-docstring,missing-class-docstring,missing-function-docstring,import-error' })
    ft('markdown'):fmt('prettier')
    ft('latex'):fmt('latexindent')

    -- Call setup() LAST!
    require('guard').setup({
        -- the only options for the setup function
        fmt_on_save = true,
        -- Use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = true,
    })
end
return {
    "nvimdev/guard.nvim",
    dependencies = {
        "nvimdev/guard-collection",
    },
    config = config,
}
