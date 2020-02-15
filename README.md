# David García Pérez dotfiles

All dot files that I usually have to configure in all the systems that I'm managing. The next sections explain in detail each one of these dot files.

## .vimrc

[Vim](https://www.vim.org/) is a highly configurable text editor. It's configuration file it is usually stored in the home folder of the user: `~/.vimrc`. If you want to use my link file just link that file to the clone one from this repository. 

The configuration makes usage of the Vundle plugin, you will need to perform this actions to enable:

```
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

The following plugins were installed using Vundle:

* [Surround](https://github.com/tpope/vim-surround)
* [Repeat](https://github.com/tpope/vim-repeat)
* [Airline](https://github.com/vim-airline)
* [Fugitive](https://github.com/tpope/vim-fugitive)
* [Vimwiki](https://github.com/vimwiki/vimwiki)
* [Instant Markdown](https://github.com/suan/vim-instant-markdown) - This requieres the installation of several external tools. Check documentation of the Plugin.

## config/alacritty/alacritty.yml

[Alacritty}(https://github.com/jwilm/alacritty) is a cross platform GPU accelerated terminal. This is its configuration file.

## config/i3/config

[i3](https://i3wm.org/) is my favourity windows manager. In reality I have installed a fork of it, called [i3-gaps](https://github.com/Airblader/i3). 

For controlling Spotify I use the following script: [sp](https://gist.github.com/streetturtle/fa6258f3ff7b17747ee3). This allows to assign shortcuts to pause/play next or previous song.

## config/dunst

Configuration for the notification daemon [Dunst}(https://dunst-project.org/).

## config/zsh

Basic configuration of zsh shell. Several submodules are used to automate the installation of functions. But at the end it is necessary to manually install spaceship. Follow the instructions here:

* [Spaceship Prompt](https://github.com/denysdovhan/spaceship-prompt).

Initial ideas about his configuration are based on the work of [Brodie Robertson](https://github.com/BrodieRobertson/dotfiles).


## Scripts

* `keyboard/switch-layout.sh`: It switches between an US language layout and a spanish one. To change it depending on the kind of text being inputed.
