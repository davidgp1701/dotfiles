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
  use {'cocopon/iceberg.vim'}
  use {'morhetz/gruvbox'}
  use {'savq/melange'}
  use {'tjdevries/colorbuddy.vim'}
  use {'tjdevries/gruvbuddy.nvim'}
	use {'tiagovla/tokyodark.nvim'}

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

  -- Terraform/Packer/etc.
  use {'hashivim/vim-hashicorp-tools'}

	-- Ansible support
	use {'pearofducks/ansible-vim'}
  
  -- Add extra information about how to color text
  -- use {'sheerun/vim-polyglot'}

  -- Airline button bar
  use {'vim-airline/vim-airline'}
  
  -- Vim Cyclest to show listchars
  use {'tjdevries/cyclist.vim'}

  -- Tree Sitter
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use {'nvim-treesitter/playground'}

  -- Neovim LSP
  use {'nvim-lua/lsp-status.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-compe'}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}

  -- Vimwiki
  use {'vimwiki/vimwiki'}

  -- Init screen
  -- use {'mhinz/vim-startify'}
	
	-- Show colors from color codes
	use {'norcalli/nvim-colorizer.lua'}

  -- Show indent lines
  use {'lukas-reineke/indent-blankline.nvim', branch='master'}

  use {'editorconfig/editorconfig-vim'}

	-- Which key
	-- use {
	-- 	"folke/which-key.nvim",
	-- 	config = function()
	-- 		require("which-key").setup {
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- refer to the configuration section below
	-- 		}
	-- 	end
	-- }
end)
