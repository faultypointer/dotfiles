{ pkgs, config, ... }:
{

  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/nvim
    ../../home/programs/helix
    ../../home/programs/shell
    ../../home/programs/direnv
    ../../home/programs/fetch
    ../../home/programs/git
    # ../../home/programs/spicetify
    # ../../home/programs/nextcloud
    ../../home/programs/thunar
    ../../home/programs/lazygit
    # ../../home/programs/zen
    ../../home/programs/duckduckgo-colorscheme
    ../../home/programs/discord
    #../../home/programs/tailscale
    ../../home/programs/firefox

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
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
      # Apps
      # bitwarden # Password manager
      vlc # Video player
      mpv
      qbittorrent
      blanket # White-noise app
      obsidian # Note taking app
      signal-desktop
      # yacreader
      # planify # Todolists
      # gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images

      gearlever
      appimage-run

      # Utils
      zip
      unzip
      optipng
      pfetch
      btop
      fastfetch

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix

    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = {
      source = ./profile_picture.jpg;
    };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
