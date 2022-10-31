{ lib, inputs, nixpkgs, home-manager, user, nur, ... }

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  user = "fergus";
in {
  orion = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs user; };
      modules = [ 
        nur.nixosModules.nur
        ./configuration.nix
        ./orion

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit user; };
          home-manager.users.${user} = {
            imports = [(import ./home.nix)];
          };
        }
      ];
  };
}
