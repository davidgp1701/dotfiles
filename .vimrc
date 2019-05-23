" Set compatibility to Vim only
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen lenght
set wrap

set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Dispaly options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them
set matchpairs+=<:>

" Show line numbers
set number

" Encoding
set encoding=utf-8

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more that 100 files at a time, 9999 lines of text,
" 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

