#!/bin/bash

# Ensures keyboard backlight is disabled when suspending and restored to the 
# previous value after restart

set -eo pipefail

action="$1"
temp_file="/tmp/g14_suspend_kbd_brightness"
brightness_file="/sys/class/leds/asus::kbd_backlight/brightness"

case "$action" in
  save)
    actual_brightness="$(cat /sys/class/leds/asus::kbd_backlight/brightness)"
    echo "$actual_brightness" > "$temp_file" 
    echo 0 > "$brightness_file" 
    ;;
  restore)
    cat "$temp_file" > "$brightness_file"
    ;;
  *)
    echo "Valid options are 'save' or 'restore'."
esac

