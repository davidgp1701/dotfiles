{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "Inconsolata"
      "JetBrainsMono"
      ]; })
    powerline
    inconsolata
    inconsolata-nerdfont
    iosevka
    font-awesome
    jetbrains-mono
    ubuntu_font_family
    terminus_font
  ];

}
