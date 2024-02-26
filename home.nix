{ config, lib, pkgs, editor, font, fontPkg, terminal, theme, wmType, nixvim, stylix, ... }:

{
  imports = [
     stylix.homeManagerModules.stylix
     nixvim.homeManagerModules.nixvim
    ./user/app/base.nix
    ./user/app/browsers.nix
    ./user/app/makemkv.nix
    ./user/app/nvim.nix
    ./user/style/fonts/fonts.nix
    ./user/wm/hyprland/hyprland.nix
    ./user/style/stylix/stylix.nix
  ];

  home.username = "davidgp";
  home.homeDirectory = "/home/davidgp";

  home.stateVersion = "23.11"; # Home Manager language version, not NixOS version, this is for API compatibility

  home.packages = [
  ];

  home.file = {
  };

  nixpkgs.config.allowUnfree = true;

  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.config/dotfiles";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  xdg.mimeApps.associations.added = {
    "application/octet-stream" = "flstudio.desktop;";
  };
  xdg.configFile."mimeapps.list".force = true;

  home.sessionVariables = {
    EDITOR = editor;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
