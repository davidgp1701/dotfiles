-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })

  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Changes the default root directory
  use { 'airblade/vim-rooter' }

  use { 'windwp/nvim-autopairs' }

  use { 'kylechui/nvim-surround' }

  -- Vim Cyclest to show listchars
  use { 'tjdevries/cyclist.vim' }

  -- Show tabs
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Git Signs
  use { 'lewis6991/gitsigns.nvim' }

  -- Comment blocks
  use { 'numToStr/Comment.nvim' }

  -- Bufferline
  use {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- Faster horizontal movement
  use { 'unblevable/quick-scope' }

  -- Use .editorconfig file from projects for indents
  use { 'editorconfig/editorconfig-vim' }

  use { 'norcalli/nvim-colorizer.lua' }

  -- Helm until it is supported by YAMLLs and syntax highlighting
  use { 'towolf/vim-helm' }

  -- We still needed
  use { 'hashivim/vim-terraform' }

  -- Lua
  use { "folke/which-key.nvim" }
end)
