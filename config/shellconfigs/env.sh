# Aliases specific per OS
case $(uname) in
    Linux)
        # In case the OS is Linux
        export TERMINAL="st"
        ;;
esac  

# General to all OS
export EDITOR="vim"
