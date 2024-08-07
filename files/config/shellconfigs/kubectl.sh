if hash kubectl 2> /dev/null; then
  alias k="kubectl"
  source <(kubectl completion zsh)
fi

KREW_ROOT="/home/david/.local/share/asdf/installs/krew/0.4.4"
export KREW_ROOT

PATH="${KREW_ROOT}/bin:${PATH}"
export PATH
