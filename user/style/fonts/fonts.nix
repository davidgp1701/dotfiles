{ config, pkgs, ...}:

{
  fonts.fontconfig.enable = true;

  fonts.fonts = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "Inconsolata" ]; })
    powerline
    inconsolata
    inconsolata-nerdfont
    iosevka
    font-awesome
    ubuntu_font_family
    terminus_font
  ];

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ 
      "FiraCode"
      "Hack"
    ];})
  ];
}
