-- Fix slow startup of lsp
local config = function()
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
        bufmap('<leader>l', require('telescope.builtin').lsp_document_symbols)
        bufmap('<leader>L', require('telescope.builtin').lsp_dynamic_workspace_symbols)

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
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = config,
}
