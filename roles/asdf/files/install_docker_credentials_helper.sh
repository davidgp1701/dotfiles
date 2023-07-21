#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

download_folder="$(xdg-user-dir DOWNLOAD)"

install() {
		curl -fsSL "$url" -o "${download_folder}/${file}"
    mv "${download_folder}/${file}" "${HOME}/.local/bin/docker-credential-secretservice"
		chmod 0755 "${HOME}/.local/bin/docker-credential-secretservice"
}

version="$1"
file="docker-credential-secretservice-v${version}.linux-amd64"
url="https://github.com/docker/docker-credential-helpers/releases/download/v${version}/${file}"

if [[ ! -x "${HOME}/.local/bin/docker-credential-secretservice" ]]
then
	install
else
  installed_version="$(docker-credential-secretservice version)"
  check_version="docker-credential-secretservice (github.com/docker/docker-credential-helpers) v${version}"

	if [[ "$check_version" != "$installed_version" ]]
	then
		install
	fi
fi
