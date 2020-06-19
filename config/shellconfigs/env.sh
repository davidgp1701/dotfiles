# Aliases specific per OS
case $(uname) in
    Linux)
        # In case the OS is Linux
        export TERMINAL="st"
        export PATH="$HOME/go/bin:$HOME/extras/neo4j-community-4.0.4/bin:$PATH"
        ;;
    Darwin)
        # Exports specific to darwin
        export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" 
        ;;
esac  

# General to all OS
export EDITOR="vim"
