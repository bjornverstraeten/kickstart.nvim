return function(use)
  use({
    'folke/which-key.nvim',
      config = function ()
	require('which-key').setup({})
      end
  })

  -- DAP
  use 'mfussenegger/nvim-dap'

  -- Linters & formatters
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires ={ 'nvim-lua/plenary.nvim' },
  })

  use 'ellisonleao/gruvbox.nvim'

  -- Latex
  use 'lervag/vimtex'

  -- Snippets
  -- use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  use 'jiangmiao/auto-pairs'

end
