-- Basic configuration
require('settings')
require('mappings')

-- Plugins
require('plugins')
require('cfg_ansible-vim')
require('cfg_nvim_colorizer')
require('cfg_nvim-compe')
require('cfg_nvim-bufferline')
require('nv-airline')
require('nv-gitgutter')
require('nv-indentline')
require('nv-nvim-autopairs')
require('nv-nvim-tree')
require('nv-terraform')
require('nv-treesitter')
require('nv-vim-rooter')

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
