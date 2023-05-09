return {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    {
        'lewis6991/gitsigns.nvim',
        -- See `:help gitsigns.txt`
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            })
        end
    }
}
