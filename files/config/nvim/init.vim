" General settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim
source $HOME/.config/nvim/general/filetypes.vim

" Load plugin configurations
source $HOME/.config/nvim/plugins/vim-plug.vim
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/cyclist.vim
source $HOME/.config/nvim/plugins/terraform.vim
source $HOME/.config/nvim/plugins/gitgutter.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/nvim-tree.vim
source $HOME/.config/nvim/plugins/completion.vim
source $HOME/.config/nvim/plugins/simple-todo.vim
source $HOME/.config/nvim/plugins/vimwiki.vim
luafile $HOME/.config/nvim/lua/lsp/init.lua
luafile $HOME/.config/nvim/lua/lsp/lsp-kind.lua
luafile $HOME/.config/nvim/lua/plugins/compe-config.lua
luafile $HOME/.config/nvim/lua/plugins/treesitter-config.lua

" Loading color configuration
" Needs to be after loading plugin configuration or it will fail
source $HOME/.config/nvim/general/color.vim
