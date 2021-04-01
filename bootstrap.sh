#!/usr/bin/env bash

################################################
# Minimal tools installation to be able to     #
# execute ansible-pull                         #
################################################

set -uo pipefail
IFS=$'\n\t'

# For the moment only for Arch Linux

# Update the system first
# sudo pacman --noconfirm -Syu

# Set the XDG configuration environment
XDG_CONFIG_HOME="${HOME}/.config"
XDG_CACHE_HOME="${HOME}/.cache"
XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME
export XDG_CACHE_HOME
export XDG_DATA_HOME

CARGO_HOME="$XDG_DATA_HOME/cargo"
export $CARGO_HOME

mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME

# Enable this to bash
echo 'XDG_CONFIG_HOME="${HOME}/.config"' >> "$HOME"/.bashrc
echo 'XDG_CACHE_HOME="${HOME}/.cache"' >> "$HOME"/.bashrc
echo 'XDG_DATA_HOME="${HOME}/.local/share"' >> "$HOME"/.bashrc
echo 'export XDG_CONFIG_HOME' >> "$HOME"/.bashrc
echo 'export XDG_CACHE_HOME' >> "$HOME"/.bashrc
echo 'export XDG_DATA_HOME' >> "$HOME"/.bashrc
echo '' >> "$HOME"/.bashrc
echo 'CARGO_HOME="$XDG_DATA_HOME/cargo"' >> "$HOME"/.bashrc
echo 'export CARGO_HOME' >> "$HOME"/.bashrc

# Install Ansible to manage dotfiles
if ! sudo pacman -Qi ansible
then
  sudo pacman --noconfirm -S ansible
fi

# Install git
if ! sudo pacman -Qi git
then
  sudo pacman --noconfirm -S git
fi

# Install paru to manage aur packages
sudo pacman --noconfirm -S --needed base-devel

if ! sudo pacman -Qi paru 
then
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  pushd /tmp/paru
    makepkg -si --noconfirm
  popd
fi

# Install AUR ansible plugin
ansible-galaxy install kewlfft.aur
