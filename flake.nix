{
  description = "David's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winbox4 = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:ironman820/winbox4";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixvim, stylix, hyprland-qtutils, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};

    # User configuration
    editor="vim";
    font = "Hack";
    fontPkg = pkgs.hack; # Font package
    terminal="alacritty";
    theme = "gruvbox-dark-hard";
    wmType = "wayland";
  in {
    nixosConfigurations = {
      valkyrie = lib.nixosSystem {
        inherit system;
        modules = [
         ./configuration.nix
         nixos-hardware.nixosModules.framework-13-7040-amd
        ];
      };
    };
    homeConfigurations = {
      davidgp = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];

        extraSpecialArgs = {
          inherit editor;
          inherit font;
          inherit fontPkg;
          inherit terminal;
          inherit theme;
          inherit wmType;
          inherit (inputs) nixvim;
          inherit (inputs) stylix;
          inherit (inputs) winbox4;
          inherit (inputs) hyprland-qtutils;
        };
      };
    };
  };
}

