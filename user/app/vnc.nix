{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    realvnc-vnc-viewer
  ];
}
