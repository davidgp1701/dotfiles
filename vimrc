" Let's learn vim the right way, dissabiling arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Mapping of keys
let mapleader=","

" Disable compatibility with the old Vim. 
set nocompatible

" It's necessary for better plugin compatibility
filetype off
filetype plugin on

" Turn on syntax highlighting
syntax on

" Automatically wrap text that extends beyond the screen layout
set wrap

" Speed vim scrolling
set ttyfast

" Shows status bar whatever the circunstances
set laststatus=2

" Cursor on iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Show line numbers
set number

" Enables plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'airblade/vim-gitgutter'

" Closes the section managed by Vundle
call vundle#end()
filetype plugin indent on

" Configuring vim-airline for the vim status bar
let g:airline_powerline_fonts = 1

" InstantMarkdown Configuration
let g:instant_markdown_autostart = 0

" Vimwiki configuration
let g:vimwiki_list = [{'path': '~/Documents/notes/', 'syntax': 'markdown', 'ext': '.md'}]
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab
