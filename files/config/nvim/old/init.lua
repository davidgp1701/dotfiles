require('user.options')
require('user.keymaps')
require('user.plugins')

-- LSP configuration
require('nvim-lsp-config')

-- Still in Vimscript
vim.cmd('source ~/.config/nvim/vimscript/cyclest.vim')
vim.cmd('source ~/.config/nvim/vimscript/filetypes.vim')
vim.cmd('source ~/.config/nvim/vimscript/fugitive.vim')
