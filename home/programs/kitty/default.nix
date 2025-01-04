{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      #zshell
      shell = "zsh";
      # Remove close window confirm
      confirm_os_window_close = "0";

      # Font config
      font_family = "jetbrains mono nerd font";
      bold_font = "jetbrains mono nerd font";
      italic_font = "jetbrains mono nerd font";
      bold_italic_font = "jetbrains mono nerd font";
      font_size = "14.0";
      adjust_line_height = "110%"; #x
      
      # Windows 
      window_padding_width = "10";
      hide_window_decorations = "yes"; #x
      background_opacity = "0.95"; #x
      dynamic_background_opacity = "yes"; #x


      # The basic colors
      foreground = "#CDD6F4";
      background = "#1E1E2E";
      selection_foreground = "#1E1E2E";
      selection_background = "#F5E0DC";

      # Cursor colors
      cursor = "#F5E0DC";
      cursor_text_color = "#1E1E2E";

      # URL underline color when hovering with mouse
      url_color = "#F5E0DC";

      # Kitty window border colors
      active_border_color = "#B4BEFE";
      inactive_border_color = "#6C7086";
      bell_border_color = "#F9E2AF";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      # Tab bar colors
      active_tab_foreground = "#11111B";
      active_tab_background = "#CBA6F7";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      tab_bar_background = "#11111B";

      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#1E1E2E";
      mark1_background = "#B4BEFE";
      mark2_foreground = "#1E1E2E";
      mark2_background = "#CBA6F7";
      mark3_foreground = "#1E1E2E";
      mark3_background = "#74C7EC";

      # The 16 terminal colors

      # black
      color0 = "#45475A";
      color8 = "#585B70";

      # red
      color1 = "#F38BA8";
      color9 = "#F38BA8";

      # green
      color2 = "#A6E3A1";
      color10 = "#A6E3A1";

      # yellow
      color3  = "#F9E2AF";
      color11 = "#F9E2AF";

      # blue
      color4  = "#89B4FA";
      color12 = "#89B4FA";

      # magenta
      color5 = "#F5C2E7";
      color13 = "#F5C2E7";

      # cyan
      color6 = "#94E2D5";
      color14 = "#94E2D5";

      # white
      color7  = "#BAC2DE";
      color15 = "#A6ADC8";
      
      # # === 标签页设置 ===
      # tab_bar_style = "powerline";
      # tab_powerline_style = "slanted";
      # active_tab_foreground = "#000";
      # active_tab_background = "#eee";
      
      # # === 光标设置 ===
      # cursor_shape = "beam";
      # cursor_blink_interval = "0.5";
      # cursor_stop_blinking_after = "15.0";
      
      # # === 滚动设置 ===
      # scrollback_lines = "10000";
      # wheel_scroll_multiplier = "5.0";
      # touch_scroll_multiplier = "1.0";
      
      # # === 性能设置 ===
      # repaint_delay = "10";
      # input_delay = "3";
      # sync_to_monitor = "yes";
      
      # # === URL设置 ===
      # url_style = "curly";
      # open_url_with = "default";
      # url_prefixes = "http https file ftp";
      
      # # === 其他设置 ===
      # enable_audio_bell = "no";
      # visual_bell_duration = "0.0";
      # copy_on_select = "yes";
      # mouse_hide_wait = "3.0";
    };
    
    # 快捷键配置
    keybindings = {
      # 窗口管理
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+w" = "close_window";
      "ctrl+shift+]" = "next_window";
      "ctrl+shift+[" = "previous_window";
      
      # 标签页管理
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      
      # 复制粘贴
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      
      # 字体大小
      "ctrl+shift+plus" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";
    };
    
    # 额外配置
    extraConfig = ''
      # Shell集成
      shell_integration enabled
      
      # 选中复制
      copy_on_select yes
      
      # 链接处理
      detect_urls yes
      
      # 性能优化
      sync_to_monitor yes
      
      # 其他自定义配置...
    '';
  };
}