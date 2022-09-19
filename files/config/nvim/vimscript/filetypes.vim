" Set default filetypes by extension
au BufRead,BufNewFile *.json.tpl set filetype=json
au BufRead,BufNewFile packerfile set filetype=json
au BufRead,BufNewFile Jenkinsfile set filetype=groovy
au BufRead,BufNewFile *.sh.tmpl set filetype=bash
au BufRead,BufNewFile *.sh.tpl set filetype=bash
au BufRead,BufNewFile *.yaml.tmpl set filetype=yaml
au BufRead,BufNewFile *.yaml.tpl set filetype=yaml
au BufRead,BufNewFile *.json.tmpl set filetype=json

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
