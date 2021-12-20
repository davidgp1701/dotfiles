-- Installs the different plugins
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim'}

  -- Basic plugins for me
  use {'tpope/vim-surround'}
  use {'tpope/vim-commentary'}
  use {'windwp/nvim-autopairs'}

  -- Git related plugins
  use {'airblade/vim-gitgutter'}
  use {'tpope/vim-fugitive'}

  -- Faster horizontal movement
  use {'unblevable/quick-scope'}

  -- Changes the default root directory
  use {'airblade/vim-rooter'}

  -- File explorer
  use {'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua'}

  -- Color Themes
  -- use {
  --   "ellisonleao/gruvbox.nvim",
  --   requires = {"rktjmp/lush.nvim"},
  --   config = "requires('gruvbox-confg')"
  -- }
  -- use {
  --   'savq/melange',
  --   config = "requires('melange-config')"
  -- }
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = "require('rose-pine-config')"
  }
  -- use {
  --   'folke/tokyonight.nvim',
  --   config = "requires('tokyonight-config')"
  -- }

	-- Tabs
	use {
		'akinsho/nvim-bufferline.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

  -- Search on vim
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- NeoClip - Clipboard manager
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'tami5/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = "require('neoclip-config')"
  }

  -- Terraform/Packer/etc.
  use {'hashivim/vim-hashicorp-tools'}

	-- Ansible support
	use {'pearofducks/ansible-vim'}

  -- Lower line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Vim Cyclest to show listchars
  use {'tjdevries/cyclist.vim'}

  -- Tree Sitter
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use {'nvim-treesitter/playground'}

  -- Neovim LSP
  use {'nvim-lua/lsp-status.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'onsails/lspkind-nvim'}

  -- Completion
  -- Sources
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"
  -- use "saadparwaiz1/cmp_luasnip" -- TODO readd it when starting to use snippets
  use "tamago324/cmp-zsh"
  -- Comparators
  use "lukas-reineke/cmp-under-comparator"

	-- Show colors from color codes
	use {'norcalli/nvim-colorizer.lua'}

  -- Show indent lines
  use {'lukas-reineke/indent-blankline.nvim', branch='master'}

  -- Use .editorconfig file from projects for indents
  use {'editorconfig/editorconfig-vim'}

  -- Neovim Org mode
  use {
    'nvim-neorg/neorg',
    requires = 'nvim-lua/plenary.nvim'
  }

end)
