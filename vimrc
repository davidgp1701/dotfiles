" Let's learn vim the right way, dissabiling arrow keys
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>

" Relative numbers
   set number relativenumber
   
   augroup numbertoggle
       autocmd!
       autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
       autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
   augroup END

" Mapping of keys
   let mapleader=","

" Disable compatibility with the old Vim. 
    set nocompatible

" It's necessary for better plugin compatibility
    filetype off
    filetype plugin on

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

" Enables plugins
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

" Let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'vim-airline/vim-airline'
    Plugin 'tpope/vim-fugitive'
    Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
    Plugin 'airblade/vim-gitgutter'
    Plugin 'hashivim/vim-terraform'
    Plugin 'jvirtanen/vim-hcl'
    Plugin 'haishanh/night-owl.vim'
    Plugin 'morhetz/gruvbox'
    Bundle 'sonph/onehalf', {'rtp': 'vim/'}
    Plugin 'tpope/vim-commentary'
    Plugin 'cespare/vim-toml'
    Plugin 'maralla/vim-toml-enhance', {'depends': 'cespare/vim-toml'}
    Plugin 'preservim/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'ctrlpvim/ctrlp.vim'
    " Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    
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

" Improving vim colors
    
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    endif

" Colorscheme 
    syntax on
    set t_Co=256
    set cursorline
    syntax enable
    "colorscheme night-owl
    " let g:terminal_color_background="#010e19"
    colorscheme gruvbox
    " To be able to see the cursor position with gruvbox
    nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
    nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
    nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
    nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
    nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
    nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
    let g:gruvbox_contrast_dark = 'hard'
    set background=dark
    set bg=dark
    " colorscheme onehalfdark
    " let g:airline_theme='onehalfdark'
    
    highlight Normal guibg=black guifg=white

" show existing tab with 4 spaces width
    set tabstop=4
" when indenting with '>', user 4 spaces
    set shiftwidth=4
" On pressing tab, insert 4 spaces
    set expandtab

" Enables clipboard to other applications
    set clipboard=unnamedplus

" NerdTree Config
    
    " Enable NerdTree if no file open
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    
    " Shortcut for NerdTree
    map <C-n> :NERDTreeToggle<CR>

    " Close vim if NerdTree is the only window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " NERDTress File highlighting
	function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 		exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 		exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
	endfunction

	call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
	call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
	call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515') 

	" If more than one window and previous buffer was NERDTree, go back to it.
	autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Splits remapping
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
