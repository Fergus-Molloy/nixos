{ config, pkgs, user, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bpytop
    exa
    feh
    flameshot
    neofetch
    ripgrep
    xclip
    bat
    fzf
    fd
    rofi
  ];
  services = {
    polybar = {
      enable = true;
      package = pkgs.polybar.override {
        i3GapsSupport = true;
        alsaSupport = true;
      };
      config = {
        "bar/top" = {
          bottom = false;
          offset-x = 2;
          offset-y = 2;
          radius = 2;
          background = "#1d2021";
          foreground = "#ebddb2";
          padding = 2;
          font-0 = "NotoSans-Regular:size=12;2";
          separator = "|";
          modules-left = "i3";
          modules-right = "cpu";
          modules-center = "date";
        };
        "module/i3" = {
          type = "internal/i3";
          show-urgent = true;
        };
        "module/cpu" = {
          type = "internal/cpu";
          warn-percentage = 90;
          label = "CPU %percentage%";
        };
        "module/date" = {
          type = "internal/date";
          date = "%d-%m-%Y";
          time = "%H:%M";
          label = "%date% %time%";
        };
      };
      script = ''polybar top &'';
    };
  };
}
