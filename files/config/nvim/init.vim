" General settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim
source $HOME/.config/nvim/general/filetypes.vim

" Load plugin configurations
source $HOME/.config/nvim/plugins/vim-plug.vim
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/terraform.vim
source $HOME/.config/nvim/plugins/gitgutter.vim
source $HOME/.config/nvim/plugins/telescope.vim
lua require("lsp") " Loads Lua configuration of nvim-lsp

" Loading color configuration
" Needs to be after loading plugin configuration or it will fail
source $HOME/.config/nvim/general/color.vim
