#!/usr/bin/env bash

declare wid="$1"
# declare class="$2"
# declare instance="$3"
# declare consequences="$4"
declare title
title="$(xdotool getwindowname "$wid")"

case "$title" in
  # All the little zoom windows shouldn't be captured, but the main ones
  # should be.
  # Main meeting window
  "*Zoom Meeting")
    # eval "$initial_consequences"
    echo "state=tiled"
    ;;
  # Main application window, not in a meeting. Also meeting join windows.
  "*Zoom*")
    # eval "$initial_consequences"
    echo "state=tiled"
    ;;
  # Misc side windows etc.
  "zoom")
    # eval "$initial_consequences"
    echo "state=floating center=on follow=on border=off focus=off"
    # zoom's main window will start titled 'zoom' initially, then change.
    # So for 'zoom' windows, wait a second after setting state just in case
    # the window is actually that first one.
    # https://www.reddit.com/r/i3wm/comments/p0fdxa
    if ! command -v xprop > /dev/null || ! command -v timeout > /dev/null; then
      exit 0
    fi
    # Monitor the Zoom window for title changes using xprop
    timeout 0.3s xprop -id "$wid" -spy _NET_WM_NAME | while read -r line; do
      # Remove prefix up to and including the first double quote
      title="${line#*\"}"
      # Remove suffix starting from the last double quote
      title="${title%\"*}"
      if [[ "$title" == Zoom* ]]; then
        echo "state=tiled center=off follow=on focus=on border=off"
        break
      fi
    done
    ;;
esac
