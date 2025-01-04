{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.cool-retro-term}/bin/cool-retro-term";
    theme = ./theme.rasi;
  };

  home.file.".config/rofi/theme.rasi".source = ./theme.rasi;
  home.file.".config/rofi/colors/dracula.rasi".source = ./colors/dracula.rasi;
  home.file.".config/rofi/colors/catppuccin.rasi".source = ./colors/catppuccin.rasi;
}