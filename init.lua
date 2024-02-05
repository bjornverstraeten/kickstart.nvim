vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.laststatus = 3
vim.o.linebreak = true
vim.g.diagnostics_visible = true

-- Disable providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')

-- line number
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.conceallevel = 2

-- color
vim.opt.termguicolors = true
vim.cmd("colorscheme kanagawa")

-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- indentation
vim.opt.autoindent = true  -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true    -- <tab> at the start of a line behaves as expected
vim.opt.expandtab = true   -- <tab> inserts spaces
vim.opt.shiftwidth = 4     -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4        -- <tab> appears as 4 spaces
vim.opt.softtabstop = 4    -- <tab> behaves as 4 spaces when editing
vim.o.breakindent = true   -- enable break indent

-- history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 500

-- clipboard
vim.g.clipboard = {
    name = "gpaste",
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

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true -- Case insensitive searching
vim.o.smartcase = true  -- UNLESS /C or capital in search

-- Highlight current cursorline
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ on_macro = true })
    end,
    group = highlight_group,
    pattern = '*',
})

-- Spelling
vim.opt.spelllang = { 'en', 'nl', 'medical' }
vim.opt.spellfile = {
    vim.fn.stdpath('config') .. '/spell/en.utf-8.add',
    vim.fn.stdpath('config') .. '/spell/medical.utf-8.add',
    vim.fn.stdpath('config') .. '/spell/nl.utf-8.add'
}

require 'keymaps'
