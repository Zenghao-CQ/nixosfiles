{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./programs
    ./themes 
    ./scripts 
  ];
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  # 也可以在这里ln文件到用户目录，或者直接text写文件到用户目录
  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 
  home.packages = with pkgs;[
    fastfetch
    firefox
    microsoft-edge
    vscode
    dconf
    zsh-powerlevel10k
    zsh-z
    # hyprland
    hyprlock
    rofi
    dunst
    cava
    swww
    bibata-cursors
    tokyo-night-gtk
    #libsForQt5.qt5.qtwayland
    #kdePackages.qtwayland
  ];
  home.stateVersion = "24.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Hao Zeng";
    userEmail = "zenghao-cq@pku.edu.cn";
  };
}
