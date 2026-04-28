{ pkgs, config, ... }:
{

  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/helix
    ../../home/programs/shell
    ../../home/programs/direnv
    ../../home/programs/git
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/duckduckgo-colorscheme
    ../../home/programs/discord
    ../../home/programs/firefox
    #../../home/programs/tailscale

    # Scripts
    ../../home/scripts # All scripts

    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/wofi
    ../../home/system/batsignal
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman

  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      vlc
      mpv
      qbittorrent
      signal-desktop
      bitwarden-desktop

      gearlever
      appimage-run

      typst

      # Utils
      zip
      unzip
      optipng
      btop

      python3
      uv
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = {
      source = ./hikaru.png;
    };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
