{ config, lib, pkgs, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
            ];

  environment.systemPackages = [ pkgs.wayland pkgs.waydroid ];

  # Configure xwayland
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      options = "caps:escape";
      variant = "";
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
