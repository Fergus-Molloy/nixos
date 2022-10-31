{
  description = "My personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:

  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    user = "fergus";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = (                                               # NixOS configurations
      import ./hosts {                                                    # Imports ./hosts/default.nix
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs home-manager user;
      }
    );
  };
}
