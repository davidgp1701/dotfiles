  " colorscheme gruvbox
" " To be able to see the cursor position with gruvbox
" nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
" nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
" let g:gruvbox_contrast_dark = 'hard'
" highlight Normal guibg=black guifg=white

" Bubblegum config
" colorscheme bubblegum-256-dark 
" set background=dark
" set bg=dark
" highlight Normal guibg=black guifg=white

" OneDark configuration
" onedark.vim override: Don't set a background color when running in a terminal;
  " if (has("autocmd") && !has("gui_running"))
  " augroup colorset
  "   autocmd!
  "   let s:white = { "gui": "#FFFFFF", "cterm": "255", "cterm16" : "15" }
  "   autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  " augroup END
" endif

" hi Comment cterm=italic
" let g:onedark_hide_endofbuffer=1
" let g:onedark_terminal_italics=1
" let g:onedark_termcolors=256

" syntax on
" colorscheme onedark

" NightOwl theme config
" checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif

" " If you have vim >=8.0 or Neovim >= 0.1.5
" if (has("termguicolors"))
"  set termguicolors
" endif

" " For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" colorscheme night-owl
" colorscheme gotham256

" Tender colorscheme configuration
" If you have vim >=8.0 or Neovim >= 0.1.5
" if (has("termguicolors"))
"  set termguicolors
" endif

" " For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" " Theme
" syntax enable
" colorscheme tender

" let g:airline_theme = 'tender'
" highlight Normal guibg=black 

" OceanicNext color schme configuration
if (has("termguicolors"))
 set termguicolors
endif

syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

colorscheme OceanicNext
let g:airline_theme='oceanicnext'

highlight Normal guibg='#0e151a'
let g:terminal_color_background='#0e151a'
