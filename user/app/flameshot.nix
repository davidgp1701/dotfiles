{  pkgs, ...}:

{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override { enableWlrSupport = true; };
  };

  home.packages = with pkgs; [
    flameshot
    grim
  ];
}
