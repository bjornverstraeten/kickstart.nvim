return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            theme = 'kanagawa',
        },
    },
    config = function()
        require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
        require("luasnip.loaders.from_snipmate").lazy_load()
    end
}
