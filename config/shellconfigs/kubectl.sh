if hash kubectl 2>/dev/null
then
    export k="kubectl"
    source <(kubectl completion zsh)
fi
