{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    mqtt-explorer
  ];
}
