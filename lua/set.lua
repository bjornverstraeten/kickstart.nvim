vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.autoindent = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftwidth = 4 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4 -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 4 -- <Tab> behaves as 4 spaces when editing
vim.o.breakindent = true -- Enable break indent

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true -- Case insensitive searching
vim.o.smartcase = true -- UNLESS /C or capital in search

-- Highlight current cursorline
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.g.clipboard = {
    name = "GPaste",
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

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({on_macro=true})
    end,
    group = highlight_group,
    pattern = '*',
})
