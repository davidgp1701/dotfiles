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
