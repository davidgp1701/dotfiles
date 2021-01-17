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
