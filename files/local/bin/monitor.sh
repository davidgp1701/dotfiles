#!/bin/bash
set -eo pipefail

place="$1"
number_desktops=$(bspc query -D | wc -l)
to_monitor="eDP1"

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

    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
           --output DP1 --off \
           --output DP2 --off \
           --output DP3 --off \
           --output VIRTUAL1 --off \
           --output DP1-8 --off \
           --output DP1-1-8 --off \
    ;;

  work)
    # xrandr --output eDP1 --primary --mode 1920x1080 --rate 60.00
    # xrandr --output DP1-8 --mode 2560x1440 --right-of eDP1
    # xrandr --output DP1-1-8 --mode 2560x1440 --right-of DP1-8
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1440 --rotate normal \
           --output DP1 --off \
           --output DP1-1 --off \
           --output DP1-1-1 --off \
           --output DP1-1-8 --mode 2560x1440 --pos 2560x0 --rotate normal \
           --output DP1-8 --mode 2560x1440 --pos 0x0 --rotate normal \
           --output DP2 --off \
           --output DP3 --off \
           --output VIRTUAL1 --off
   
    if (( number_desktops > 3 ))
    then
      bspc desktop 4 --to-monitor DP1-8 
      bspc desktop 5 --to-monitor DP1-8
      bspc desktop 6 --to-monitor DP1-8
      bspc desktop 7 --to-monitor DP1-1-8
      bspc desktop 8 --to-monitor DP1-1-8 
      bspc desktop 9 --to-monitor DP1-1-8 
      bspc desktop 10 --to-monitor DP1-1-8
    else
      bspc monitor DP1-8 -d 4 5 6 
      bspc monitor DP1-1-8 -d 7 8 9 10
    fi
    
    bspc desktop Desktop --remove > /dev/null
    bspc desktop Desktop_DP1 --remove > /dev/null
    ;;

  home)
    xrandr --output eDP1 --primary --mode 1920x1080 --rate 60.00
    xrandr --output DP1 --mode 3840x2160 --right-of eDP1

    if (( number_desktops > 3 ))
    then
      to_monitor="DP1"
      move_all_desktops
    else
      bspc monitor DP1 -d 4 5 6 7 8 9 10
    fi
    
    bspc desktop Desktop --remove > /dev/null
    bspc desktop Desktop_DP1 --remove > /dev/null
    ;;

  santiago)
    
    xrandr --output eDP1 --mode 1920x1080 --rate 60.00
    xrandr --output DP3 --primary --mode 1920x1200 --rate 59.95 --right-of eDP1

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

# Reload bar and set again the background
~/.config/polybar/launch.sh
feh --bg-fill /home/david/Pictures/somonstalenhag.se/l_ash09_big.jpg &
# feh --bg-fill /home/david/Pictures/wallpapers/20190127_delta-del-ebro__DGP8946_0007.jpg &
