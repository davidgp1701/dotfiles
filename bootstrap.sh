#!/usr/bin/env bash

################################################
# Minimal tools installation to be able to     #
# execute ansible-pull                         #
################################################

set -euo pipefail
IFS=$'\n\t'

bw_version="1.19.1"
bw_url="https://github.com/bitwarden/cli/releases/download/v${bw_version}/bw-linux-${bw_version}.zip"

# Detect first the Linux variant
os_id="$( grep '^ID=' /etc/os-release | cut -d'=' -f2 )"

# Update the system first
# sudo pacman --noconfirm -Syu
# sudo apt full-upgrade

# Set the XDG configuration environment
XDG_CONFIG_HOME="${HOME}/.config"
XDG_CACHE_HOME="${HOME}/.cache"
XDG_DATA_HOME="${HOME}/.local/share"
XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CONFIG_HOME
export XDG_CACHE_HOME
export XDG_DATA_HOME
export XDG_STATE_HOME

CARGO_HOME="$XDG_DATA_HOME/cargo"
export CARGO_HOME

mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_STATE_HOME

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

# Add local bin to PATH
echo 'PATH="$PATH:$HOME/.local/bin"' >> "$HOME"/.bashrc

install_package() {
  local _package_arch="$1"
  local _package_debian="$2"

  if [ "$os_id" == "arch" ]
  then
    if ! sudo pacman -Qi "$_package_arch"
    then
      sudo pacman --noconfirm -S "$_package_arch"
    fi
  elif [ "$os_id" == "debian" ]
  then
    if ! sudo dpkg -s "$_package_debian"
    then
      sudo apt-get install -y "$_package_debian"
    fi
  else
    echo "Distro family: ${os_id} no supported"
    exit 1
  fi
}


# Install Ansible to manage dotfiles
install_package ansible ansible

# Install git
install_package git git

# Install curl
install_package curl curl

# Install bitwarden CLI

if [ "$os_id" == "arch" ]
then
  install_package bitwarden-cli not_available
elif [ "$os_id" == "debian" ]
then
  curl -L "$bw_url" --output /tmp/bw.zip
  pushd /tmp
    unzip bw.zip
    [[ -d "${HOME}/.local/bin" ]] || mkdir -p "${HOME}/.local/bin"
    mv bw "${HOME}/.local/bin"
    chmod +x "${HOME}/.local/bin/bw"
    rm bw.zip
  popd
fi

# Install jq
install_package jq jq

# Install build essentials
install_package base-devel build-essential

# Ensure Paru is installed in Arch systems
if [ "$os_id" == "arch" ]
then
  if ! sudo pacman -Qi paru
  then
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    pushd /tmp/paru
      makepkg -si --noconfirm
    popd
  fi
fi

# Install AUR ansible plugin
ansible-galaxy collection install kewlfft.aur

# Ensure config folder Bitwarden exits
[[ -d "${HOME}/.config/Bitwarden" ]] || mkdir -p "${HOME}/.config/Bitwarden"

# Ensure log folder for Ansible exists
[[ -d "${HOME}/.local/var/log" ]] || mkdir -p "${HOME}/.local/var/log"

