# Profile file. Runs on login. Environmental variables are set here.

# XDG base directory config
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.local/runtime"

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

# ZSH config directory
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Gradle XDG config
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Force vagrant to follow XDG config
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"

# Force docker to follow XDG config
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Vim config
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

