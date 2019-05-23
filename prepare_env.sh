#!/bin/bash

set -eo pipefail

dirname=$(dirname "$0")

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
