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

  " Neovim LSP
  Plug 'neovim/nvim-lspconfig'
call plug#end()
