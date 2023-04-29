-- [[ Basic Keymaps ]]
vim.keymap.set('i', 'jj', '<Esc>', {})
vim.keymap.set({ 'n', 'v' }, '<leader>h', ':noh<CR>', {})
vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>')

-- [[ Setting options ]]
-- See `:help vim.o`

-- Using system clipboard
vim.g.clipboard = {
    name = 'GPaste',
    copy = {
        ['+'] = { 'gpaste-client', 'add' },
        ['*'] = { 'gpaste-client', 'add' },
    },
    paste = {
        ['+'] = { 'gpaste-client', '--use-index', 'get', '0' },
        ['*'] = { 'gpaste-client', '--use-index', 'get', '0' },
    },
    cache_enabled = true,
}

-- highlight current cursorline
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

vim.opt.relativenumber = true

-- vim.o.spelllang = {'en_us', 'nl', 'medical'}

-- [[ Setting providers ]]
vim.g.python3_host_prog = '/home/bjorn/miniconda3/bin/python3'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- -- [[ Configure LuaSnip ]]
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })
require("luasnip.loaders.from_snipmate").lazy_load()
-- { paths = "~/.local/share/nvim/lazy/vim-snippets" }
