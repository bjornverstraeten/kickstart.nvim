local config = function()
    require('mini.comment').setup()
    require('mini.pairs').setup({
        mappings = {
            ["`"] = false,
        },
    })
end

return {
    'echasnovski/mini.nvim',
    version = false,
    config = config,
}
