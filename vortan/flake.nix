{
  description = "Home Manager configuration of david";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, nixvim, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      font = "Jetbrains mono";
      fontPkg = pkgs.jetbrains-mono;
      terminal="/usr/bin/kitty";
      theme = "gruvbox-dark-hard";
      wmType = "wayland";
    in {
      homeConfigurations."david" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit font;
          inherit fontPkg;
          inherit terminal;
          inherit theme;
          inherit wmType;
          inherit (inputs) nixvim;
          inherit (inputs) stylix;
        };
      };
    };
}
