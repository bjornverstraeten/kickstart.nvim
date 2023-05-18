-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Providers
vim.g.python3_host_prog = '/home/bjorn/scripts/base/bin/python'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Install package manager
-- :help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup('plugins')

-- Keymaps
require('mappings')

-- Options
-- See `:help vim.o`

-- Indentation
vim.opt.autoindent = true  -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true    -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true   -- <Tab> inserts spaces
vim.opt.shiftwidth = 4     -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4        -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 4    -- <Tab> behaves as 4 spaces when editing
vim.o.breakindent = true   -- Enable break indent

-- Save undo history
vim.o.undofile = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Colors
vim.o.termguicolors = true
-- gruvbox
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd("colorscheme gruvbox")
-- kanagawa
-- vim.cmd("colorscheme kanagawa")
-- gruvbox
vim.cmd("colorscheme gruvbox-baby")

-- Search
vim.o.hlsearch = true   -- Set highlight on search
vim.o.ignorecase = true -- Case insensitive searching
vim.o.smartcase = true  -- UNLESS /C or capital in search

-- Make line numbers default
vim.wo.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Highlight current cursorline
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

-- Set spell languages
vim.opt.spelllang = { 'en', 'nl', 'medical' }

-- Set spellfiles
vim.opt.spellfile = {
    vim.fn.stdpath('config') .. '/spell/en.utf-8.add',
    vim.fn.stdpath('config') .. '/spell/medical.utf-8.add',
    vim.fn.stdpath('config') .. '/spell/nl.utf-8.add'
}

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Sync clipboard between OS and Neovim.
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
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

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Specify snippet path
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_snipmate").lazy_load()

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
end

-- Enable the following language servers
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    clangd = {},
    texlab = {},
    jedi_language_server = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}
