#!/bin/bash

set -eo pipefail

# This script installs all wanted packages
# in Mac OS X.

dirname="$( cd "$(dirname "$0")" ; pwd -P )"

# First it is necessary to install XCode:
"${dirname}"/xcode.sh

# Second, Homebrew installation:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installing Oh My Zsh!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"