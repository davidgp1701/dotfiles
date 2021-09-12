#!/bin/bash

# Based on this example: https://radumirea.com/blog/ncmpcpp-with-album-art

set -eo pipefail

source "$(ueberzug library)"

COVER="/tmp/album_cover.jpg"

function add_cover {
  ImageLayer::add [identifier]="img" [x]="2" [y]="1" [path]="$COVER"
}

ImageLayer 0< <(
if [ ! -f "$COVER" ]; then
  cp "$HOME/.config/ncmpcpp/default_cover.jpg" "$COVER"
fi
while inotifywait -q -q -e close_write "$COVER"; do
  add_cover
done
)
