local on_attach = function(_, bufnr)
    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>a', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_definition)

    bufmap('gr', require('telescope.builtin').lsp_references)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('K', vim.lsp.buf.hover)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()
require('mason-lspconfig').setup_handlers({
    function(servername)
        require('lspconfig')[servername].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,

    ['lua_ls'] = function()
        require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        }
    end
})


-- local lsp_zero = require('lsp-zero')
-- -- lsp_zero.extend_lspconfig()
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     handlers = {
--         lsp_zero.default_setup,
--     },
-- })
--
-- lsp_zero.on_attach(function(_, bufnr)
--     lsp_zero.default_keymaps({ buffer = bufnr })
-- end)
--
-- local lua_opts = lsp_zero.nvim_lua_ls()
-- require('lspconfig').lua_ls.setup(lua_opts)
