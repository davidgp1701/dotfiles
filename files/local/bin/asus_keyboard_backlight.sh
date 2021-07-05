#!/usr/bin/env bash

max_brightness="$(cat /sys/class/leds/asus::kbd_backlight/max_brightness)"
brightness="$(cat /sys/class/leds/asus::kbd_backlight/brightness)"

action="$1"

case "$action" in
  increase)
    if [[ $brightness -lt $max_brightness ]]
    then
      ((brightness=brightness+1))
      echo "$brightness" >> /sys/class/leds/asus::kbd_backlight/brightness
    fi
    ;;
  decrease)
    if [[ $brightness -ne 0 ]]
    then
      ((brightness=brightness-1))
      echo "$brightness" >> /sys/class/leds/asus::kbd_backlight/brightness
    fi
    ;;
  *)
    echo "Valid options are 'increase' or 'decrease'."
esac
