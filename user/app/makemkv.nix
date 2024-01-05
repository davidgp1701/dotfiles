{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    makemkv
    ffmpeg
    handbrake
    mpv
  ];
}
