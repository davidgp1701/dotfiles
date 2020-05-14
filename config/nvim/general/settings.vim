" General settings
syntax enable                       " Enables syntax highlighing
set hidden                          " Required to keep multiple buffers open multiple buffers
set wrap                            " Wrap long lines
set encoding=utf-8                  " The encoding displayed 
set pumheight=10                    " Makes popup menu smaller
set fileencoding=utf-8              " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=2                     " More space for displaying messages
set iskeyword+=-                    " treat dash separated words as a word text object"
set mouse=a                         " Enable your mouse
set splitbelow                      " Horizontal splits will automatically be below
set splitright                      " Vertical splits will automatically be to the right
set t_Co=256                        " Support 256 colors
set conceallevel=0                  " So that I can see `` in markdown files
set tabstop=2                       " Insert 2 spaces for a tab
set shiftwidth=2                    " Change the number of space characters inserted for indentation
set smarttab                        " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                       " Converts tabs to spaces
set smartindent                     " Makes indenting smart
set autoindent                      " Good auto indent
set laststatus=0                    " Always display the status line
set cursorline                      " Enable highlighting of the current line
set showtabline=2                   " Always show tabs 
set nobackup                        " This is recommended by coc
set nowritebackup                   " This is recommended by coc
set updatetime=300                  " Faster completion
set timeoutlen=500                  " By default timeoutlen is 1000 ms
set formatoptions-=cro              " Stop newline continution of comments
set clipboard=unnamedplus           " Copy paste between vim and everything else
set ttyfast                         " Fast scrolling

" Sets relative numbers
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Improving vim colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" You can't stop me
cmap w!! w !sudo tee %

