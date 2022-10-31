{ lib, pkgs, user, ... }:

let
  host = "orion";
in {
  imports = {
    ./hardware-configuration.nix
  };

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
}


