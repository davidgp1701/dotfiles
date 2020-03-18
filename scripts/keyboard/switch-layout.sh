#!/bin/bash

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

autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source "${ZDOTDIR:-$HOME}"/.zkbd/"$TERM"-"$VENDOR"-"$OSTYPE"

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
