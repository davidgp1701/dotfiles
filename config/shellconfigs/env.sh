# Aliases specific per OS
case $(uname) in
    Linux)
        # In case the OS is Linux
        export TERMINAL="st"
        ;;
    Darwin)
        # Exports specific to darwin
        export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" 
        ;;
esac  

# General to all OS
export EDITOR="vim"
