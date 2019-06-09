#!/bin/bash

set -eo pipefail

# Script that installs all the wanted
# packages in a new Arch Linux 
# installation.

# Update pacman reposotories and install any updates
pacman -Syu --noconfirm

# Install zsh
pacman -S --noconfirm zsh