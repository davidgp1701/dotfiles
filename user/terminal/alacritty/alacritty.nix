{ config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    alacritty
  ];  
  
  programs.alacritty.enable = true;  

  programs.alacritty.settings = {
    window = {
      padding = {
        x = 6;
        y = 6;
      };
      dynamic_padding = true;
    };
  };
}
