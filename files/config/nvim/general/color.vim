" OneDark ColoScheme settings
" TODO Investigate which settings having loading this first and then 
" iceberg theme improve Terraform color rendition on files
colorscheme onedark

let g:airline_theme='onedark'
let g:lightline = { 'colorscheme': 'onedark' }

if (has("autocmd"))
  augroup colorextend
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#000000" } })
  augroup END
endif

" Iceberg ColorScheme settings
colorscheme iceberg
" let g:lightline = { 'colorscheme': 'icebergDark' }
let g:airline_theme = 'iceberg'

