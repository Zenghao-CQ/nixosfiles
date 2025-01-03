{ config, lib, pkgs, ... }:

{
  imports = [
    ./cava
  ];

  gtk = {
    enable = true;
    iconTheme = {
     name = "Yaru-magenta-dark";
     package = pkgs.yaru-theme;
    };

    theme = {
     name = "Tokyonight-Dark-B-LB";
     package = pkgs.tokyo-night-gtk;
    };

    # cursorTheme = {
    #  name = "Bibata-Modern-Classic";
    #  package = pkgs.bibata-cursors;
    # };
  };
  
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
}
