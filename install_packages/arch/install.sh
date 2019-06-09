#!/bin/bash

set -eo pipefail

# Script that installs all the wanted
# packages in a new Arch Linux 
# installation.

# Update pacman reposotories and install any updates
sudo pacman -Syu --noconfirm

dirname="$( cd "$(dirname "$0")" ; pwd -P )"

# Install zsh
"${dirname}"/zsh.sh

