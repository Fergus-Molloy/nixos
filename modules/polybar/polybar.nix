{config, lib, pkgs, ... }:

{
  services = {
    polybar = {
      enable = true;
      package = pkgs.polybar.override {
        i3GapsSupport = true;
        alsaSupport = true;
      };
      script = ''polybar top &'';
      config = {
        "colors" = {
          fg-dark       = "#a89984";
          fg            = "#ebdbb2";
          fg-light      = "#fbf1c7";
          bg-dark       = "#1d2021";
          bg            = "#282828";
          bg-light      = "#3c3836";
          red           = "#cc241d";
          red-bright    = "#fb4934";
          green         = "#98971a";
          green-bright  = "#b8bb26";
          yellow        = "#d79921";
          yellow-bright = "#fabd2f";
          blue          = "#458588";
          blue-bright   = "#83a598";
          purple        = "#b16286";
          purple-bright = "#d3869b";
          aqua          = "#689d6a";
          aqua-bright   = "#8ec07c";
          orange        = "#d65d0e";
          orange-bright = "#fe8019";
        };
        "bar/top" = {
          bottom = false;
          offset-x = 5;
          offset-y = 5;
          radius = 2;
          background = "\${colors.bg}";
          foreground = "\${colors.fg}";
          padding = 2;
          font-0 = "NotoSans-Regular:size=12;2";
          separator = " | ";
          modules-left = "i3";
          modules-center = "date";
          modules-right = "cpu memory filesystem time";
        };
        "module/i3" = {
          type = "internal/i3";
          show-urgent = true;
          label-focused = "#";
        };
        "module/date" = {
          type = "internal/date";
          date = "%a, %d %b %Y";
          label = "%date%";
        };
        "module/time" = {
          type = "internal/date";
          date = "";
          time = "%H:%M";
          label = "%time%";
        };
        "module/cpu" = {
          type = "internal/cpu";
          warn-percentage = 90;
          label = "CPU %percentage%%";
        };
        "module/memory" = {
          type = "internal/memory";
          label = "MEM %used% / %total%";
        };
        "module/filesystem" = {
          type = "internal/fs";
          mount-0 = "/";
          interval = "10";
          label-mounted = "%mountpoint% %used% / %free%";
        };
      };
    };
  };
}
