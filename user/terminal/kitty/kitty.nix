{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
  programs.kitty.enable = true;
  programs.kitty.settings = {
    background_opacity = lib.mkForce "0.90";
    window_padding_width = 1;
    # modify_font = "cell_width 90%";
  };
}
