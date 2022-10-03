#!/usr/bin/env bash

set -eo pipefail

cd ~

export SDL_VIDEODRIVER=wayland
# export MOZ_ENABLE_WAYLAND=1
export XKB_DEFAULT_OPTIONS=caps:escape
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24

# dbus-launch --sh-syntax --exit-with-session Hyprland
exec Hyprland

