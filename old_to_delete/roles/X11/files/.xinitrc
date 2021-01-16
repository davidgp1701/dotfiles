#!/bin/sh

. $HOME/.profile

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Compositor
picom -f &

# Remap keys
setxkbmap -option "caps:swapescape"
xmodmap -e "keycode 78 = Insert NoSymbol Insert"
xmodmap -e "keycode 127 = Delete NoSymbol Delete"
xmodmap -e "keycode 107 = XF86Copy"

# Wallpaper
nitrogen --restore &

# dwmblocks
dwmblocks &

# Execute DWM
while true
do
  dwm > /dev/null 2>&1
done

exec dwm
