#!/usr/bin/env bash

################################################
# Minimal tools installation to be able to     #
# execute ansible-pull                         #
################################################

set -uo pipefail
IFS=$'\n\t'

# For the moment only for Arch Linux

# Update the system first
sudo pacman --noconfirm -Syu

# Install Ansible to manage dotfiles
sudo pacman --noconfirm -S ansible git

# Install yay to manage aur packages
sudo pacman --noconfirm -S --needed base-devel

if ! sudo pacman -Si yay;
then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  pushd /tmp/yay
    makepkg -si --noconfirm
  popd
fi

# Install AUR ansible plugin
ansible-galaxy install kewlfft.aur
