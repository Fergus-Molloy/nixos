# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, user, ... }:

{
# Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    default = "saved";
  };

# Fonts
  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
    noto-fonts
    noto-fonts-emoji
    font-awesome
  ];

#networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Enable networking
    networking.networkmanager.enable = true;

# Set your time zone.
  time.timeZone = "Europe/London";

# Select internationalisation properties.
  i18n.defaultLocale = "en_GB.utf8";

# Enable the X11 windowing system.
# Enable the KDE Plasma Desktop Environment.
  services.xserver = {
    enable=true;
    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+i3";
    };
    windowManager = {
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
    };
    libinput.mouse.accelProfile = "flat";
    layout = "gb";
    xkbVariant = "";
  };

  services.picom = {
    enable = true;
    vSync = true;
    fade = true;
    backend = "glx";
    settings = {
      glx-swap-method = 2;
    };
    opacityRules = [
      "90:class_g = 'kitty'"
    ];
  };

# Configure console keymap
  console.keyMap = "uk";

# Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

  };

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

  # enable zsh
  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  environment.variables = {
    EDITOR = "nvim";
    SHELL = "zsh";
    TERM = "kitty";
    TERMINAL = "kitty";
  };

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;


# List packages installed in system profile. To search, run:
# $ nix search wget
  environment.systemPackages = with pkgs; [
      neovim
      wget
      emacs
      kitty
      git
  ];

# Configure automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

    nix = {
      package = pkgs.nixFlakes;
      extraOptions = "experimental-features = nix-command flakes";
    };
}
