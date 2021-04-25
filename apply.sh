#!/bin/bash

set -eo pipefail

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

ROOTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
export ROOTDIR

# Apply playbooks
hostname="$(hostname -f)"

ansible-playbook local.yml \
	-l "$hostname" \
	--extra-vars "task_credentials=${task_credentials} task_server=${task_server}"

# Get taskwarrior certificates
taskwarrior_item_id="$(bw get item taskwarrior | jq '.id' -r)"
bw_get_file "$taskwarrior_item_id" ca.crt ~/.local/share/task/certs
bw_get_file "$taskwarrior_item_id" private.certificate.pem ~/.local/share/task/certs
bw_get_file "$taskwarrior_item_id" private.key.pem ~/.local/share/task/certs

# Lock again Bitwarden vault
bw lock
