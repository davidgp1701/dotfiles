" Vim plug configuration and plugins
call plug#begin('~/.config/nvim/plugged')
  " Basic plugins for me
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'

  " Terraform/Packer/etc.
  Plug 'hashivim/vim-hashicorp-tools'
  
  " Airline button bar
  Plug 'vim-airline/vim-airline'
  
  " Color Themes
  Plug 'cocopon/iceberg.vim' 
call plug#end()
