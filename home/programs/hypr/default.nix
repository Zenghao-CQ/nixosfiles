{ config, lib, pkgs, ... }:

{
  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    
    # hyprland的具体配置
    extraConfig = ''
      # 在这里添加hyprland的配置
      monitor=,preferred,auto,auto

      exec-once = dunst
      exec-once = waybar
      exec-once = hyprctl setcursor Bibata-Modern-Classic 24

      source = /home/alex/.config/hypr/colors
      # exec = pkill waybar & sleep 0.5 && waybar
      exec-once = swww init & sleep 0.5 && exec wallpaper_random

      # fcitx
      windowrule = pseudo, fcitx
      exec-once=fcitx5 -d -r
      exec-once=fcitx5-remote -r        
      exec-once=hyprlock
 
      # Input config
      input {
          # kb_layout = br,us
          # kb_variant =
          # kb_model =
          # kb_options =
          # kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = true
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      
      general {
        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle
      }

      # # Change transparency of focused and unfocused windows
      # active_opacity = 0.9
      # inactive_opacity = 0.93
      
      # shadow {
      #     enabled = true
      #     range = 4
      #     render_power = 3
      #     color = rgba(1a1a1aee)
      # }
      # # https://wiki.hyprland.org/Configuring/Variables/#blur
      # blur {
      #     enabled = true
      #     size = 3
      #     passes = 1

      #     vibrancy = 0.1696
      # }

      animations {
        enabled = yes
        bezier = ease,0.4,0.02,0.21,1
        animation = windows, 1, 3.5, ease, slide
        animation = windowsOut, 1, 3.5, ease, slide
        animation = border, 1, 6, default
        animation = fade, 1, 3, ease
        animation = workspaces, 1, 3.5, ease
      }

      dwindle {
          pseudotile = yes
          preserve_split = yes
      }

      # master {
      #     new_is_master = yes
      # }

      gestures {
          workspace_swipe = false
      }

      $mainMod = SUPER

      # basic
      bind = $mainMod, F, fullscreen,
      bind = $mainMod,Return,exec,kitty
      bind = $mainMod,Q,killactive,
      bind = $mainMod,M,exit,
      bind = $mainMod,L,exec,hyprlock 
      bind = $mainMod, D, exec, rofi -show drun -show-icons # 应用程序启动器
      bind = $mainMod, R, exec, rofi -show run

      bind = $mainMod, p, exec, playerctl play-pause
      bind = $mainMod, bracketright, exec, playerctl next
      bind = $mainMod, bracketleft, exec, playerctl previous

      bind = , XF86AudioRaiseVolume, exec, volumectl -u up
      bind = , XF86AudioLowerVolume, exec, volumectl -u down
      bind = , XF86AudioMute, exec, volumectl toggle-mute
      bind = , XF86AudioMicMute, exec, volumectl -m toggle-mute

      bind = , XF86MonBrightnessUp, exec, lightctl up
      bind = , XF86MonBrightnessDown, exec, lightctl down

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Move focus with mainMod + arrow keys
      # bind = $mainMod, h, movefocus, l
      # bind = $mainMod, l, movefocus, r
      # bind = $mainMod, k, movefocus, u
      # bind = $mainMod, j, movefocus, d
      bind = $mainMod, Tab, cyclenext,
      bind = $mainMod, Tab, bringactivetotop,

      # sets repeatable binds for resizing the active window
      # binde=,l,resizeactive,10 0
      # binde=,h,resizeactive,-10 0
      # binde=,k,resizeactive,0 -10
      # binde=,j,resizeactive,0 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

    '';
  };

  home.file.".config/hypr/colors".text = ''
    $background = rgba(1d192bee)
    $foreground = rgba(c3dde7ee)

    $color0 = rgba(1d192bee)
    $color1 = rgba(465EA7ee)
    $color2 = rgba(5A89B6ee)
    $color3 = rgba(6296CAee)
    $color4 = rgba(73B3D4ee)
    $color5 = rgba(7BC7DDee)
    $color6 = rgba(9CB4E3ee)
    $color7 = rgba(c3dde7ee)
    $color8 = rgba(889aa1ee)
    $color9 = rgba(465EA7ee)
    $color10 = rgba(5A89B6ee)
    $color11 = rgba(6296CAee)
    $color12 = rgba(73B3D4ee)
    $color13 = rgba(7BC7DDee)
    $color14 = rgba(9CB4E3ee)
    $color15 = rgba(c3dde7ee)
  ''; 
}
