#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

plugin="$1"
version="$2"

# update version here as needed
if ! grep -qsxE "${plugin}[[:space:]].*" "${HOME}/.tool-versions"; then
	asdf global "$plugin" "$version"
fi
