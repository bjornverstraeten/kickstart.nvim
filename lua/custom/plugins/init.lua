return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
  },
  'tpope/vim-obsession',
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        search = { enabled = true },
        char = { enabled = false },
      },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'lervag/vimtex',
    config = function()
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
  {
    'dgagn/diagflow.nvim',
    event = 'LspAttach',
    opts = {},
  },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = 'original'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format', 'ruff_organize_imports' },
        markdown = { 'prettier' },
        tex = { 'latexindent' },
      },
    },
  },
  {
    'folke/which-key.nvim',
    opts = { delay = 600 },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      commit_editor = {
        kind = 'split',
        show_staged_diff = false,
      },
    },
  },
  {
    'papis.nvim',
    enabled = false,
    dir = '~/project/papis.nvim',
    dependencies = {
      'kkharji/sqlite.lua',
      'MunifTanjim/nui.nvim',
      'pysan3/pathlib.nvim',
      'nvim-neotest/nvim-nio',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('papis').setup {}
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
