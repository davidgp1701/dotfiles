# Aliases specific per OS
case $(uname) in
    Darwin)
        # In case the OS is Mac Os X
        gls="/usr/local/bin/gls"
        if [ -f "$gls" ]
        then
            alias ls="gls --color"
            alias ll="gls --color -la"
        else
            alias ls="ls -G"
        fi
        ;;
    Linux)
        # In case the OS is Linux
        alias ls="ls --color"
        alias ll="ls --color -la"
        ;;
esac        

alias wbarcelona="curl wttr.in/barcelona"
alias k="kubectl"
alias v="vim"