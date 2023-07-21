#!/usr/bin/env bash

set -eo pipefail

declare actual_layout
actual_layout="$(hyprctl devices -j | jq -r '.keyboards[0].active_keymap')"
declare -r english_layout="English (US)"

if [ "${actual_layout}" = "${english_layout}" ]; then
  hyprctl keyword input:kb_layout es
else
  hyprctl keyword input:kb_layout us
fi
