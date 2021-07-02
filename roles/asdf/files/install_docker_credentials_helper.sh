#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' 

install() {
		curl -fsSL "$url" -o "${HOME}/Downloads/${file}"
		tar -C "${HOME}/.local/bin/" -xzf "${HOME}/Downloads/${file}"
		rm "${HOME}/Downloads/${file}" 
		chmod 0755 "${HOME}/.local/bin/docker-credential-secretservice"
}

version="$1"
file="docker-credential-secretservice-v${version}-amd64.tar.gz"
url="https://github.com/docker/docker-credential-helpers/releases/download/v${version}/${file}"

if [[ ! -x "${HOME}/.local/bin/docker-credential-secretservice" ]]
then
	install	
else
  installed_version="$(docker-credential-secretservice version)"

	if [[ "$version" != "$installed_version" ]]
	then
		install
	fi
fi
