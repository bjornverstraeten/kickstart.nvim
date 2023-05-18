return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ":TSUpdate",
    },
    {
        'nvim-treesitter/playground'
    },
    {
        'ThePrimeagen/harpoon'
    },
    {
        'mbbill/undotree'
    },
    {
        'tpope/vim-fugitive'
    },
    {
        'lewis6991/gitsigns.nvim',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'folke/neodev.nvim' },
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required

        }
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    },
    {
        'nvim-lualine/lualine.nvim',
    },
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    {
        "windwp/nvim-autopairs",
        opts = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim"
    },
    {
        'lervag/vimtex'
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

}
