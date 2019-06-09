#!/bin/bash

set -eo pipefail

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
