{
  description = "David's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, stylix, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};

    # User configuration
    editor="vim";
    font = "Jetbrains Mono";
    fontPkg = pkgs.jetbrains-mono; # Font package
    terminal="alacritty";
    theme = "catppuccin-mocha";
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
          inherit (inputs) stylix;
        };
      };
    };
  };
}

