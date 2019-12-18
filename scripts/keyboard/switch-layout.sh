#!/bin/sh

actual=$(setxkbmap -print | grep xkb_geometry | cut -d '(' -f2 | cut -d ')' -f1)

if [ "$actual" = "pc104" ] 
then
    setxkbmap -model pc105 -layout es
else
    setxkbmap -model pc104 -layout us 
fi

xmodmap -e "keycode 78 = Insert NoSymbol Insert"
xmodmap -e "keycode 127 = Delete NoSymbol Delete"
xmodmap -e "keycode 107 = XF86Copy"
