#!/bin/bash

set -eo pipefail

# Finding what the OS is:

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "Working in a Linux environment"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Working in a Mac OS X environment"
else
  echo "OS not supported..."
  exit 0 
fi

dirname="$( cd "$(dirname "$0")" ; pwd -P )"

# Preparing the vim configuration files
(
  echo "Updating .vimrc configuration file"
  
  vimrc="${HOME}/.vimrc"
  
  if [ -f "$vimrc" ]
  then
    mv "$vimrc" "${vimrc}.old"
  fi

  ln -s "$dirname"/.vimrc "$vimrc" 
)
