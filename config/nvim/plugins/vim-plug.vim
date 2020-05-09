" vim-plug configuration {{{
call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'cespare/vim-toml'
  Plug 'maralla/vim-toml-enhance', {'depends': 'cespare/vim-toml'}
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neoclide/coc.nvim', {'branch':'release'}
  Plug 'hashivim/vim-hashicorp-tools'
  Plug 'unblevable/quick-scope'
  Plug 'dbakker/vim-paragraph-motion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tomasiser/vim-code-dark'
call plug#end()
