-- Basic configuration
require('settings')
require('mappings')

-- Plugins
require('plugins')
require('nv-compe')
require('nv-airline')
require('nv-gitgutter')
require('nv-nvim-tree')
require('nv-terraform')
require('nv-treesitter')
require('nv-vim-rooter')

-- Still in Vimscript
vim.cmd('source ~/.config/nvim/vimscript/cyclest.vim')
vim.cmd('source ~/.config/nvim/vimscript/filetypes.vim')
vim.cmd('source ~/.config/nvim/vimscript/vimwiki.vim')

-- LSP
require('lsp')
require('lsp.lsp-kind')
require('lsp.lua-ls')

-- Color Theme
require('theme')
