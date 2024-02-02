-- Line number
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.conceallevel = 2

-- Color
vim.opt.termguicolors = true
vim.cmd.colorscheme("gruvbox")

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Indentation
vim.opt.autoindent = true  -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true    -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true   -- <Tab> inserts spaces
vim.opt.shiftwidth = 4     -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4        -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 4    -- <Tab> behaves as 4 spaces when editing
vim.o.breakindent = true   -- Enable break indent

-- History
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 500

-- Clipboard
vim.g.clipboard = {
    name = "GPaste",
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

-- Statusline
vim.opt.laststatus = 3

-- word wrap
vim.o.linebreak = true
