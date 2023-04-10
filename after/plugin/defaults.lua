-- [[ Basic Keymaps ]]
vim.keymap.set('i', 'jj', '<Esc>', {})
vim.keymap.set({ 'n', 'v' }, '<leader>h', ':noh<CR>', {})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Using system clipboard
vim.g.clipboard = {
  name = 'GPaste',
  copy = {
    ['+'] = {'gpaste-client', 'add'},
    ['*'] = {'gpaste-client', 'add'},
  },
  paste = {
    ['+'] = {'gpaste-client', '--use-index', 'get', '0'},
    ['*'] = {'gpaste-client', '--use-index', 'get', '0'},
  },
  cache_enabled = true,
}
vim.opt.clipboard = 'unnamedplus'

vim.o.hlsearch = true

-- highlight current cursorline
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

vim.opt.relativenumber = true

-- Set colorscheme
vim.o.background = 'dark'
vim.cmd([[hi Normal guibg=none]])

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = '|',
    section_separators = '',
  },
}

-- [[ Setting providers ]]
vim.g.python3_host_prog = '/home/bjorn/miniconda3/bin/python3'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- -- [[ Configure LuaSnip ]]
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
-- require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.local/share/nvim/site/pack/packer/start/vim-snippets/snippets"})

