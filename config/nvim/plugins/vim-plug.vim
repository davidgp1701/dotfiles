" vim-plug configuration {{{
call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'cespare/vim-toml'
  Plug 'maralla/vim-toml-enhance', {'depends': 'cespare/vim-toml'}
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neoclide/coc.nvim', {'branch':'release'}
  Plug 'hashivim/vim-hashicorp-tools'
  Plug 'unblevable/quick-scope'
  Plug 'dbakker/vim-paragraph-motion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'joshdick/onedark.vim'
  Plug 'haishanh/night-owl.vim'
  Plug 'whatyouhide/vim-gotham' 
  Plug 'jacoborus/tender.vim'
  Plug 'kyoz/purify', { 'rtp': 'vim' }  
  Plug 'mhartington/oceanic-next'
  Plug 'sheerun/vim-polyglot'
  " Plug 'tomasiser/vim-code-dark'
  Plug 'morhetz/gruvbox'
  " Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
