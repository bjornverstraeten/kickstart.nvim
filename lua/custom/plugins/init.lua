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
        toml = { 'prettier' },
        tex = { 'latexindent' },
        r = { 'air' },
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
      graph_style = 'unicode',
      commit_editor = {
        kind = 'split',
        show_staged_diff = false,
      },
    },
  },
  {
    'papis.nvim',
    dir = '~/project/papis.nvim',
    lazy = false,
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
    cmd = { 'Papis' },
    keys = {
      { '<leader>sp', '<cmd>Papis search<CR>', { desc = '[S]earch [P]apis library' } },
      { 'gpf', '<cmd>Papis at-cursor open-file<cr>', { desc = '[G]oto [P]apis [F]ile' } },
      { 'gpi', '<cmd>Papis at-cursor show-popup<cr>', { desc = '[G]oto [P]apis [I]nfo' } },
    },
  },
  {
    'Vigemus/iron.nvim',
    config = function()
      local common = require 'iron.fts.common'
      local view = require 'iron.view'
      require('iron').setup {
        config = {
          scratch_repl = false,
          repl_definition = {
            python = {
              command = { 'ipython', '--no-autoindent' },
              format = common.bracketed_paste_python,
              block_dividers = { '# %%', '#%%' },
            },
            r = {
              command = { 'R' },
            },
          },
          -- repl_open_cmd = require('iron.view').split.vertical.rightbelow '%40',
          repl_open_cmd = {
            view.split.vertical.rightbelow '%40', -- cmd_1: open a repl to the right
            view.split.rightbelow '%25', -- cmd_2: open a repl below
          },
        },
        keymaps = {
          toggle_repl = '<leader>rr',
          toggle_repl_with_cmd_1 = '<leader>rv',
          toggle_repl_with_cmd_2 = '<leader>rh',
          restart_repl = '<leader>rR',
          send_motion = '<leader>rc',
          visual_send = '<leader>rc',
          send_file = '<leader>rf',
          send_line = '<leader>rl',
          send_paragraph = '<leader>rp',
          send_until_cursor = '<leader>ru',
          send_mark = '<leader>rm',
          send_code_block = '<leader>rb',
          send_code_block_and_move = '<leader>rn',
          mark_motion = '<leader>mc',
          mark_visual = '<leader>mc',
          remove_mark = '<leader>md',
          clear = '<leader>cl',
        },
        ignore_blank_lines = true,
      }
    end,
  },
  {
    {
      'quarto-dev/quarto-nvim',
      dependencies = {
        'jmbuhr/otter.nvim',
        'nvim-treesitter/nvim-treesitter',
      },
      opts = {
        codeRunner = { default_method = 'iron' },
      },
    },
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
}
-- vim: ts=2 sts=2 sw=2 et
