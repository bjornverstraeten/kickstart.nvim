-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- indentation
vim.opt.autoindent = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <tab> inserts spaces
vim.opt.shiftwidth = 4 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4 -- <tab> appears as 4 spaces
vim.opt.softtabstop = 4 -- <tab> behaves as 4 spaces when editing
vim.o.breakindent = true -- enable break indent

vim.opt.hlsearch = false

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 500

-- Disable word wrap
vim.o.wrap = false

-- Recursively search file
vim.opt.path:append '**'

-- Search strings
vim.o.grepprg = 'rg -S --vimgrep'

-- Filter quickfix list
vim.cmd 'packadd cfilter'

-- Add underline to diagnostics
vim.diagnostic.config {
  underline = true
}

-- vim: ts=2 sts=2 sw=2 et
