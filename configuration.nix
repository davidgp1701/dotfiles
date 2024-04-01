{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./system/hardware/bluetooth.nix 
      ./system/hardware/fwupd.nix
      ./system/hardware/opengl.nix
      ./system/hardware/thunderbolt.nix
      # ./system/hardware/wifi.nix
      # ./system/util/suspend-and-hibernate.nix # Not working right now, wifi card not working after restart
      ./system/wm/hyperland.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-c1516d7a-6faf-4f6c-8282-d753314cd23a".device = "/dev/disk/by-uuid/c1516d7a-6faf-4f6c-8282-d753314cd23a";
  networking.hostName = "valkyrie"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.davidgp = {
    isNormalUser = true;
    description = "David Garcia Perez";
    extraGroups = [ "networkmanager" "wheel" "cdrom" ];
    packages = with pkgs; [
      firefox
      kitty
      wezterm
    ];
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/davidgp/.local/share/syncthing";
    configDir = "/home/davidgp/.local/share/syncthing";
    user = "davidgp";
    group = "users";
    guiAddress =  "127.0.0.1:8384";
    overrideFolders = false;
    overrideDevices = false;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     gimp
     git
     pciutils
     thunderbolt
     usbutils
     vim
     wget
  ];

  fonts.enableDefaultPackages = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
