return function(use)

  -- DAP
  use 'mfussenegger/nvim-dap'

  -- Linters & formatters
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires ={ 'nvim-lua/plenary.nvim' },
  })



  use 'jiangmiao/auto-pairs'

end
