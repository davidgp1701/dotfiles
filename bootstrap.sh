#!/usr/bin/env bash

################################################
# Minimal tools installation to be able to     #
# execute ansible-pull                         #
################################################

set -eo pipefail

# For the momento only for Linux
sudo pacman -Syu
sudo pacman --noconfirm -S ansible git

