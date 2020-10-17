#!/usr/bin/env bash

set -e

# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Host file location
HOSTS="$ROOTDIR/hosts"

# Main playbook
PLAYBOOK="$ROOTDIR/dotfiles.yaml"

# Runs ansible playblook for our user 
# Ansible must be installed first
ansible-playbook -i "$HOSTS" "$PLAYBOOK" 

exit 0
