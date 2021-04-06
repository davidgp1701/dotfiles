# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt
autoload -U colors && colors

# History file in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="~/.cache/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)	

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Fix Control arrow to move a word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Load personal configuration shell files
for f in ~/.config/shellconfigs/*; do source "$f"; done

# Add zsh syntax highlighting pluing
source ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Update path
export PATH=$PATH:/home/david/.local/bin:/home/david/.okta/bin

unsetopt MULTIBYTE

# Update fpath for locally installed modules
fpath=( "$HOME/.zfunctions" $fpath )
#
# Spaceship Prompt
autoload -U promptinit; promptinit
eval "$(starship init zsh)"
