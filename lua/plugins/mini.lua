return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.comment').setup()
        require('mini.pairs').setup({
            mappings = {
                ["`"] = false,
            },
        })
    end
}
