{
  description = "My personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = github:nix-community/NUR;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, ... }:

  let
    user = "fergus";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = (                                               # NixOS configurations
      import ./hosts {                                                    # Imports ./hosts/default.nix
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs home-manager user nur;
      }
      );
    };
}
