{ lib, pkgs, user, ... }:

let
  host = "orion";
in {
  imports = [(import ./hardware-configuration.nix)];
  virtualisation.docker.enable = true;

  networking.hostName = "${host}";

  # allow for dual booting
  boot.loader.grub.useOSProber = true;

  # fix incorrect time because of windows
  time.hardwareClockInLocalTime = true;

  # configure nvidia gpu
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    lld # for faster compile times in rust
    clang # for faster compile times in rust
    pkg-config
    discord
    vscode
    postgresql
    nodejs
    nodePackages.npm
  ];
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
}
