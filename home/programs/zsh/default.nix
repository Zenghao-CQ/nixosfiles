{ config, pkgs, inputs, ... }:
{
  # zsh
  programs.fzf.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -alF";
      n-purge = "nix-collect-garbage -d";
    };
    initExtra = ''
    proxy_on() {
      export http_proxy="http://127.0.0.1:7890"
      export https_proxy=$http_proxy
      export socks5_proxy="socks5://127.0.0.1:7890"
      echo "HTTP Proxy on"
    }

    proxy_off() {
      unset http_proxy
      unset https_proxy
      unset socks5_proxy
      echo "HTTP Proxy off"
    }
    '';
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