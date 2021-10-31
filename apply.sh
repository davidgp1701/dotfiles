#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Function to get files stored in Bitwarden server
bw_get_file() {
  item_id="$1"
  file="$2"
  directory="$3"

  bw get attachment "$file" --itemid "$item_id" --output "$directory"/"$file"
}

# Unlock bitwarden vault
BW_SESSION="$(bw unlock --raw)"
export BW_SESSION

# Task login details
task_credentials="$(bw get username taskwarrior)"
task_server="$(bw get item taskwarrior | jq '.login.uris[0].uri' -r)"

# Inoreader app credentials
inoreader_app_id="$(bw get item www.inoreader.com | jq '.fields[] | select(.name == "app_id") | .value' -r)"
inoreader_app_key="$(bw get item www.inoreader.com | jq '.fields[] | select(.name == "app_key") | .value' -r)"
inoreader_login="$(bw get username www.inoreader.com)"
inoreader_password="$(bw get password www.inoreader.com)"

# Wireguard key configuration
short_hostname="$(hostname -a | xargs)"
wireguard_public_key_dagger="$(bw get item wireguard | jq '.fields[] | select(.name == "public_key_dagger") | .value' -r)"
wireguard_private_key_local="$(bw get item wireguard | jq ".fields[] | select(.name == \"private_key_${short_hostname}\") | .value" -r)"
wireguard_endpoint="$(bw get item wireguard | jq '.fields[] | select(.name == "endpoint") | .value' -r)"

ROOTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
export ROOTDIR

# Apply playbooks
hostname="$(hostname -f)"

ansible-playbook local.yml \
	-l "$hostname" \
	--extra-vars \
	  "task_credentials=${task_credentials} \
		task_server=${task_server} \
		inoreader_app_id=${inoreader_app_id} \
		inoreader_app_key=${inoreader_app_key} \
		inoreader_login=${inoreader_login} \
		inoreader_password=${inoreader_password} \
    wireguard_public_key_dagger=${wireguard_public_key_dagger} \
    wireguard_endpoint=${wireguard_endpoint} \
    wireguard_private_key_local=${wireguard_private_key_local}"

# Get taskwarrior certificates
taskwarrior_item_id="$(bw get item taskwarrior | jq '.id' -r)"
bw_get_file "$taskwarrior_item_id" ca.crt ~/.local/share/task/certs
bw_get_file "$taskwarrior_item_id" private.certificate.pem ~/.local/share/task/certs
bw_get_file "$taskwarrior_item_id" private.key.pem ~/.local/share/task/certs

# Lock again Bitwarden vault
bw lock
