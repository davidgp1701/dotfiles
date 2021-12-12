-- Basic configuration
require('settings')
require('mappings')

-- Plugins
require('plugins')
require('cfg_ansible-vim')
require('cfg_gitgutter')
require('cfg_indentline')
require('cfg_lualine')
require('cfg_neoclip')
require('cfg_nvim-autopairs')
require('cfg_nvim-bufferline')
require('cfg_nvim_colorizer')
require('cfg_nvim-tree')
require('cfg_terraform')
require('cfg_treesitter')
require('cfg_vim-rooter')
require('cfg_neorg')

-- Still in Vimscript
vim.cmd('source ~/.config/nvim/vimscript/cyclest.vim')
vim.cmd('source ~/.config/nvim/vimscript/filetypes.vim')
vim.cmd('source ~/.config/nvim/vimscript/fugitive.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/vimwiki.vim')

-- LSP
require('lsp')
require('lsp.lsp-kind')
require('lsp.lua-ls')
require('cfg_nvim-cmp')

