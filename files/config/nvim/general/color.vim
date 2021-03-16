" OneDark ColoScheme settings
let g:onedark_color_overrides = {
\  "comment_grey": { "gui": "#9CA3B0", "cterm": "59", "cterm16": "15" }
\}

colorscheme onedark

let g:airline_theme='onedark'
" let g:lightline = { 'colorscheme': 'onedark' }

"onedark.vim override: Set a custom background color in the terminal
if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:background = { "gui": "#00000", "cterm": "235", "cterm16": "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background }) "No `fg` setting
  augroup END
endif

" if (has("autocmd"))
"   augroup colorextend
"     " Override the `Identifier` background color in GUI mode
"     autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#000000" } })
"   augroup END
" endif

" Iceberg ColorScheme settings
" colorscheme iceberg
" let g:airline_theme = 'iceberg'

set background=dark

" Gruvbox color scheme
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_italic=1
" let g:airline_theme='gruvbox'
" colorscheme gruvbox
