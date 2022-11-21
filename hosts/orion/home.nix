{pkgs, ... }:

{
  home = {
    programs.direnv = {
        enable = true;
        nix-direnv ={
            enable = true;
            enableFlakes = true;
          };
      };
    programs.zsh.enable = true;
  };
}
