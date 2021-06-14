-- Basic configuration
require('settings')
require('mappings')

-- Plugins
require('plugins')
require('cfg_airline')
require('cfg_ansible-vim')
require('cfg_gitgutter')
require('cfg_indentline')
require('cfg_nvim-autopairs')
require('cfg_nvim-bufferline')
require('cfg_nvim_colorizer')
require('cfg_nvim-compe')
require('cfg_nvim-tree')
require('cfg_terraform')
require('cfg_treesitter')
require('cfg_vim-rooter')

-- Still in Vimscript
vim.cmd('source ~/.config/nvim/vimscript/cyclest.vim')
vim.cmd('source ~/.config/nvim/vimscript/vimwiki.vim')
vim.cmd('source ~/.config/nvim/vimscript/filetypes.vim')

-- LSP
require('lsp')
require('lsp.lsp-kind')
require('lsp.lua-ls')

-- Color Theme
require('theme')
