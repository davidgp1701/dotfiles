{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    powerline
    powerline-fonts
    powerline-symbols
    nerd-fonts.hack
    nerd-fonts.inconsolata
    iosevka
    font-awesome
    nerd-fonts.jetbrains-mono
    ubuntu-classic
    terminus_font
  ];

}
