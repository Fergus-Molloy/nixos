{config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "[](#d65d0e)$username$hostname[](bg:#98971a fg:#d65d0e)$directory[](fg:#98971a bg:#689d6a)$git_branch$git_status[](fg:#689d6a bg:#458588)$nodejs$rust[](fg:#458588 bg:#b16286)$cmd_duration[](#b16286)$line_break $character";
      username = {
        show_always = true;
        style_user = "bg:#d65d0e";
        style_root = "bg:#d65d0e";
        format = "[$user]($style)";
      };
      hostname = {
        ssh_only = false;
        style = "bg:#d65d0e";
        format = "[@$hostname ]($style)";
      };
      directory = {
        style = "bg:#98971a";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
        truncate_to_repo = true;
      };
      git_branch = {
        style = "bg:#689d6a";
        format = "[ $symbol$branch ]($style)";
      };
      git_status = {
        style = "bg:#689d6a";
        format = "[$all_status$ahead_behind ]($style)";
      };
      nodejs = {
        style = "bg:#458588";
        format = "[ $symbol ($version)]($style)";
      };
      rust = {
        style = "bg:#458588";
        format = "[ $symbol\($toolchain\)]($style)";
      };
      cmd_duration = {
        style = "bg:#b16286";
        format = "[ $duration]($style)";
      };
    };
  };
}
