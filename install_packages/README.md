# Manual requirements

To download this script and make it work, probably you need to install first some requirementes manually, here is the list by OS.

## Arch Linux

Install git:

```console
sudo pacman -S git
```

The command allows several options in case of the available hardware. This is for what I have around, so maybe you need to custimize this for your own hardware.

* ```xps15_9570``` - It will install the necessary modules and Xorg to be able to use the nvidia graphics card.

## Mac OS X

Although there is a script to install XCode tools, you will need to do it before executing such script, since we need to have git installed to download this source tree.

To do so, open a terminal and execute the following command:

```console
xcode-select --install
```