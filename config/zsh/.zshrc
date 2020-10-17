# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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

# Load zsh-syntax-highlighting
source ~/dotfiles/plugins/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Update path
export PATH=$PATH:/home/david/.local/bin:/home/david/.okta/bin

unsetopt MULTIBYTE

# Update fpath for locally installed modules
fpath=( "$HOME/.zfunctions" $fpath )

SPACESHIP_PROMPT_ORDER=(
    user
    host
    dir
    kubectl
    aws
    terraform
    git
    vi_mode
    exit_code
    char
)

SPACESHIP_GIT_PREFIX="| "
SPACESHIP_DIR_COLOR="#96cafe" 
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=true
SPACESHIP_AWS_PREFIX="| "
SPACESHIP_AWS_SYMBOL="☁️· "
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_COLOR="#cfffab"
SPACESHIP_KUBECTL_PREFIX="| "
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=true
SPACESHIP_KUBECONTEXT_COLOR="#cfffab"
SPACESHIP_KUBECONTEXT_PREFIX=""
SPACESHIP_KUBECONTEXT_SUFFIX=""
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship
