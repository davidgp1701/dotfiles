#!/usr/bin/env bash

watch_folder="${HOME}/Downloads/torrents/watch"

pushd "$watch_folder" || exit
[[ "$1" =~ xt=urn:btih:([^&/]+) ]] || exit;
aria2c --bt-metadata-only=true --bt-save-metadata=true "$1"

