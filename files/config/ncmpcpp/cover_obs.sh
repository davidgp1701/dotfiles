#!/bin/bash

# Based on this example: https://radumirea.com/blog/ncmpcpp-with-album-art
set -x
set -eo pipefail

MUSIC_DIR="$HOME/Music"
COVER="/tmp/album_cover.jpg"
COVER_SIZE="400"

file="$MUSIC_DIR/$(mpc --format %file% current)"
album="${file%/*}"
art="$album/cover.jpg"
if [ "$art" = "" ]; then
  art="$HOME/.config/ncmpcpp/default_cover.jpg"
fi
ffmpeg -loglevel 0 -y -i "$art" -vf "scale=$COVER_SIZE:-1" "$COVER"
