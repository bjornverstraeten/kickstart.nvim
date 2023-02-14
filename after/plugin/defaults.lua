-- [[ Basic Keymaps ]]
vim.keymap.set('i', 'jk', '<Esc>', {})
vim.keymap.set('i', 'kj', '<Esc>', {})
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
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd [[
    silent! colorscheme gruvbox
    hi Normal guibg=none
]]

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

-- -- [[ Configure LuaSnip ]]
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.local/share/nvim/site/pack/packer/start/vim-snippets/snippets"})

