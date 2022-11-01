{config, lib, pkgs, ... }:

{
  config = {
    services = {
      polybar = {
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
            type = "internal/cpu"
            warn-percentage = 90
            label = "CPU %percentage%"
          };
          "module/date" = {
            type = "internal/date"
            date = "%d-%m-%Y"
            time = "%H:%M"
            label = "%date% %time%"
          };
        };
        script = ''polybar top &'';
      };
    };
  };
}
