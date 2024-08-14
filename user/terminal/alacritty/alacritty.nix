{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    alacritty
  ];

  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    env.TERM = "xterm-256color";
    font = {
      size = 14;
    };
    window = {
      padding = {
        x = 6;
        y = 6;
      };
      dynamic_padding = true;
    };
  };
}
