#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' 

plugin="$1"
version="$2"

if ! asdf plugin list | grep -qsxF "$plugin"; then
	asdf plugin add "$plugin"
fi
# update version here as needed
if ! grep -qsxE "${plugin}[[:space:]].*" "${HOME}/.tool-versions"; then
	asdf install "$plugin" "$version"
	asdf global "$plugin" "$version"
fi
