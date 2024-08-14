{ pkgs, ...}:

{
  home.packages = with pkgs; [
    htop
    ripgrep
    unzip
  ];
}
