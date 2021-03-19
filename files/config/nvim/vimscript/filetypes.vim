" Set default filetypes by extension
au BufRead,BufNewFile *.json.tpl set filetype=json
au BufRead,BufNewFile packerfile set filetype=json
au BufRead,BufNewFile Jenkinsfile set filetype=groovy

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
