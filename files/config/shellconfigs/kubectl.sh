if hash kubectl 2>/dev/null
then
    alias k="kubectl"
    source <(kubectl completion zsh)
fi
