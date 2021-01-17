# David García Pérez dotfiles

All configuration files in my typical Arch Linux installations.

## Bootstrap

After basic configuration of your Arch Linux system apply the following command to update the system and install `git` and `ansible`.

```
source <(https://raw.githubusercontent.com/davidgp1701/dotfiles/master/bootstrap.sh)
```

## Execution

To configure the system apply the following changes:

```
ansible-pull -U https://github.com/davidgp1701/dotfiles.git
```

## Notes about programs installed

### NeoVim

In a fresh installation it is necessary to execute the command `:PlugInstall` to install the plugins inside neovim.

Plugins that are going to be used:
* [vim-plug](https://github.com/junegunn/vim-plug) - Plugin manager.
* [iceberg](https://cocopon.github.io/iceberg.vim/) - Color scheme.
* [airline](https://github.com/vim-airline/vim-airline) - Lean and mean status line.
* [vim-hashicorp-tools](https://github.com/hashivim/vim-hashicorp-tools) - Collection of tools for Terraform and other Hashicorp files.
* [vim-surround](https://github.com/tpope/vim-surround) - Change the surround of a string.
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git integration with vim.
* [vim-comentary](https://github.com/tpope/vim-commentary) - Add comments to vim.
* [vim-gutter](https://github.com/airblade/vim-gitgutter) - Adds navigation of git changes and shows icons in the left bar.
