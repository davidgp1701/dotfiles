" Vim plug configuration and plugins
call plug#begin('~/.config/nvim/plugged')
  " Basic plugins for me
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  " Git related plugins
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Faster horizontal movement
  Plug 'unblevable/quick-scope'

  " Changes the default root directory
  Plug 'airblade/vim-rooter'

  " Terraform/Packer/etc.
  Plug 'hashivim/vim-hashicorp-tools'
  
  " Airline button bar
  Plug 'vim-airline/vim-airline'
  
  " Color Themes
  Plug 'cocopon/iceberg.vim' 
  
  " Add extra information about how to color text
  Plug 'sheerun/vim-polyglot'

  " Search on vim
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Tree Sitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Neovim LSP
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'nathunsmitty/diagnostic-nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'neovim/nvim-lspconfig'

  " File explorer
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
call plug#end()
