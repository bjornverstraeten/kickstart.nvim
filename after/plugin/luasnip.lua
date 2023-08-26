local ls = require 'luasnip'
ls.config.setup({
    enable_autosnippets = true,
    store_selection_keys = '<leader>s',
})
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })

vim.keymap.set({ "i", "s" }, "<c-a>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
