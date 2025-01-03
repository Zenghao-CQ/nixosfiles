{ config, pkgs, inputs, ... }:
{
  imports = [ ./programs ./themes ];
  home.username = "alex";
  home.homeDirectory = "/home/alex";
  # 也可以在这里ln文件到用户目录，或者直接text写文件到用户目录
  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 
  home.packages = with pkgs;[
    fastfetch
    firefox
    vscode
    dconf
    # zsh
    zsh-powerlevel10k
    zsh-z
    # hyprland
    #waybar
    rofi
    dunst
    # theme
    bibata-cursors
    tokyo-night-gtk
    #libsForQt5.qt5.qtwayland
    #kdePackages.qtwayland
  ];
  home.stateVersion = "24.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Hyprland
  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    
    # hyprland的具体配置
    extraConfig = ''
      # 在这里添加hyprland的配置
      monitor=,preferred,auto,auto
      
      $mainMod = SUPER
      bind = $mainMod, F, fullscreen,

      # 设置一些基本按键绑定
      bind = $mainMod,Return,exec,kitty
      bind = $mainMod,Q,killactive,
      bind = $mainMod,M,exit,
      #bind = $mainMod,L,exec,firefox 
      bind = $mainMod, D, exec, rofi -show drun -show-icons # 应用程序启动器
      bind = $mainMod, R, exec, rofi -show run

      exec-once = dunst
      exec-once = waybar

    '';
  };
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.git = {
    enable = true;
    userName = "Hao Zeng";
    userEmail = "zenghao-cq@pku.edu.cn";
  };
  # zsh
  programs.fzf.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -alF";
    };
    #initExtra = ''
    #  [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
    #'';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "zsh-z";
        src = "${pkgs.zsh-z}/share/zsh-z";
      }
    ];
  };
}
