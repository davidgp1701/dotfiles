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
    Plugin 'vim-scripts/icansee.vim'
    Plugin 'neoclide/coc.nvim', {'branch':'release'}
    Plugin 'hashivim/vim-hashicorp-tools'
    Plugin 'rrethy/vim-hexokinase', { 'build': 'make hexokinase' }
    
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

" CoC configuration
    set hidden
    set nobackup
    set nowritebackup
    set cmdheight=2
    set updatetime=300
    set shortmess+=c
    set signcolumn=yes

	inoremap <silent><expr> <TAB>
      	\ pumvisible() ? "\<C-n>" :
      	\ <SID>check_back_space() ? "\<TAB>" :
      	\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	if has('patch8.1.1068')
	  " Use `complete_info` if your (Neo)Vim version supports it.
	  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
	  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder.
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying codeAction to the current line.
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Introduce function text object
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	" Use <TAB> for selections ranges.
	" NOTE: Requires 'textDocument/selectionRange' support from the language server.
	" coc-tsserver, coc-python are the examples of servers that support it.
	nmap <silent> <TAB> <Plug>(coc-range-select)
	xmap <silent> <TAB> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline.
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Mappings using CoCList:
	" Show all diagnostics.
	nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands.
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
	nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" By default, Vim associates .tf files with TinyFugue - tell it not to.
    autocmd! filetypedetect BufRead,BufNewFile *.tf
    autocmd BufRead,BufNewFile *.tf set filetype=terraform
    autocmd BufRead,BufNewFile *.tfvars set filetype=terraform
    autocmd BufRead,BufNewFile *.tfstate set filetype=json
    autocmd BufRead,BufNewFile *.tfstate.backup set filetype=json
 
" Hexokinase configuration
      let g:Hexokinase_highlighters = ['backgroundfull']

