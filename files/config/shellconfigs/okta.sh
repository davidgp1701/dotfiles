# Okta
#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
   . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
   PATH="$HOME/.okta/bin:$PATH"
fi

## New configuration place
if [[ -f "$HOME/.local/share/okta/bash_functions" ]]; then
    . "$HOME/.local/share/okta/bash_functions"
fi
if [[ -d "$HOME/.local/share/okta/bin" && ":$PATH:" != *":$HOME/.local/share/okta/bin:"* ]]; then
    PATH="$HOME/.local/share/okta/bin:$PATH"
fi
