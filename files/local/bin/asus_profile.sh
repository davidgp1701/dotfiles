#!/usr/bin/env bash

set -euo pipefail

notify() {
  _profile="$1"
  notify-send 'Power Profiles' "$_profile"
}

state_file="/var/lib/power-profiles-daemon/state.ini"

profile="$(grep 'Profile' < $state_file | cut -d'=' -f2)"

case "$profile" in
  performance)
    powerprofilesctl set balanced
    notify balanced
    ;;
  balanced)
    powerprofilesctl set power-saver
    notify power-saver
    ;;
  power-saver)
    powerprofilesctl set performance
    notify performance
    ;;   
  *)
    notify "Error, unknown power profile"
    exit 1
    ;;
esac

