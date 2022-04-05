#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

helper="pass"
docker_config="${HOME}/.config/docker/config.json"
timestamp="$(date -u +%Y%m%d%H%M%S)"

if [[ -f "$docker_config" ]]
then
  credsStore="$(jq -r '.credsStore' "$docker_config")"

	# shellcheck disable=SC2076
	if [[ ! "${credsStore}" =~ "${helper}" ]]
	then
		# Backup, Replace and reset permissions
		cp "$docker_config" "${docker_config}.${timestamp}"

		jq --arg credsStore "${helper}" '.credsStore = $credsStore' "${docker_config}.${timestamp}" > "$docker_config"
	fi
else
	cat > "$docker_config" << END
{
  "credsStore": "${helper}"
}
END
fi

chmod 0600 "$docker_config"
