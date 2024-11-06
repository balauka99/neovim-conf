-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  use({
	  'rebelot/kanagawa.nvim',
	  as = 'kanagawa',
	  config = function()
		  vim.cmd('colorscheme kanagawa')
	  end
  })

  -- Tree-sitter form git
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- Play-ground, use TSPlayground<tab>
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- Great higlights for nftables
  use('nfnty/vim-nftables')

  use {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      config = function()
          require"startup".setup({theme = "evil"})
      end
  }

  -- LSP config
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-nvim-lua'},
          {'L3MON4D3/LuaSnip'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          {'saadparwaiz1/cmp_luasnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }
  -- LSP for java
  use {'mfussenegger/nvim-jdtls'}
  -- Surround for closing in visual: (closing)
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

  -- save sessions
  use {'tpope/vim-obsession'}

  use {
      'chipsenkbeil/distant.nvim',
      branch = 'v0.3',
      config = function()
          require('distant'):setup()
      end
  }

end)
