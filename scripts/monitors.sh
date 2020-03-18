#!/bin/bash

set -eo pipefail

place="$1"
number_desktops=$(bspc query -D | wc -l)
to_monitor="eDP1"

reload_bar() {
  ~/.config/polybar/launch.sh
}

move_all_desktops() {
  bspc desktop 4 --to-monitor $to_monitor 
  bspc desktop 5 --to-monitor $to_monitor 
  bspc desktop 6 --to-monitor $to_monitor
  bspc desktop 7 --to-monitor $to_monitor
  bspc desktop 8 --to-monitor $to_monitor
  bspc desktop 9 --to-monitor $to_monitor 
  bspc desktop 10 --to-monitor $to_monitor
}

add_desktops() {
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1)
  do
    if [ "$monitor" != "eDP1" ]
    then
      if [[ $(bspc query -D --names) != *"Desktop_$monitor"* ]]
      then 
          bspc monitor "$monitor" -a "Desktop_${monitor}" > /dev/null 
      fi
    fi
  done
}

case $place in

  alone)
    add_desktops 
        
    if (( number_desktops > 3 ))
    then
      to_monitor="eDP1"
      move_all_desktops
    fi
   
    for monitor in $(bspc query -M --names)
    do
      if [ "$monitor" != "eDP1" ]
      then
        bspc monitor "$monitor" --remove > /dev/null
      fi
    done
   
    xrandr --output DP3 --off
    xrandr --output eDP1 --primary --mode 1920x1080 --rate 60.00

    reload_bar
    ;;

  work)
    echo "To be configured..."
    ;;

  home)
    echo "To be configured..."
    ;;

  santiago)
    
    xrandr --output eDP1 --primary --mode 1920x1080 --rate 60.00
    xrandr --output DP3 --mode 1920x1200 --rate 59.95 --right-of eDP1

    reload_bar

    if (( number_desktops > 3 ))
    then
      to_monitor="DP3"
      move_all_desktops
    else
      bspc monitor DP3 -d 4 5 6 7 8 9 10
    fi
    
    bspc desktop Desktop --remove > /dev/null

    ;;
esac

feh --bg-fill /home/david/Pictures/wallpapers/20190127_delta-del-ebro__DGP8946_0007.jpg &
