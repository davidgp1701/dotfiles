{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    alacritty
  ];  
  
  programs.alacritty.enable = true;  
}
