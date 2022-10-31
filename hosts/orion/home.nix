{pkgs, ... }:

{
  home = with pkgs; {
    rustup
    twemoji-color-font
  };
}
