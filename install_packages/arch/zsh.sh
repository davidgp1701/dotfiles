#!/bin/bash

set -eo pipefail

# Install zsh and Oh my zsh!!!
sudo pacman -S --noconfirm zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
