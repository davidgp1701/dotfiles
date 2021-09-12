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

echo 'EDITOR="vim"' >> "$HOME"/.bashrc
echo 'export EDITOR' >> "$HOME"/.bashrc

# NPM configuration
echo 'NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history' >> "$HOME"/.bashrc
echo 'NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc' >> "$HOME"/.bashrc
echo 'export NODE_REPL_HISTORY' >> "$HOME"/.bashrc
echo 'export NPM_CONFIG_USERCONFIG' >> "$HOME"/.bashrc

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

# Install bitwarden CLI
if ! sudo pacman -Qi bitwarden-cli
then
  sudo pacman --noconfirm -S bitwarden-cli
fi

# Install jq
if ! sudo pacman -Qi jq
then
  sudo pacman --noconfirm -S jq
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
ansible-galaxy collection install kewlfft.aur
