#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' 

npm_folder="${XDG_CONFIG_HOME}/npm"
npm_config="${npm_folder}/npmrc"

if [[ ! -d "$npm_folder" ]]
then
	mkdir "$npm_folder"
fi

if [[ ! -f "$npm_config" ]]
then
  touch "$npm_config"
fi

# Add configuration lines if necessary
if ! grep -qsxE "cache=${HOME}/.cache/npm" "$npm_config"
then
  echo "cache=${HOME}/.cache/npm" >> "$npm_config"
fi

if ! grep -qsxE "tmp=/run/user/1000/npm" "$npm_config"
then
  echo "tmp=/run/user/1000/npm" >> "$npm_config"
fi

if ! grep -qsxE "init-module=${HOME}/.config/npm/config/npm-init.js" "$npm_config"
then
  echo "init-module=${HOME}/.config/npm/config/npm-init.js" >> "$npm_config"
fi

if ! grep -qsxE "prefix=${HOME}/.local/share/npm" "$npm_config"
then
  echo "prefix=${HOME}/.local/share/npm" >> "$npm_config"
fi

