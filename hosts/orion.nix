{ lib, inputs, nixpkgs, home-manager, user, ... }:
let
  host = "orion";
in {
  networking.hostName = "${host}";
}
