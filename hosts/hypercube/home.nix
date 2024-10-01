{ pkgs, config, inputs, ... }: {

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/nvim
    ../../home/programs/qutebrowser
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/btop
    ../../home/programs/cava
    ../../home/programs/firefox
    ../../home/programs/direnv
    ../../home/programs/helix

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/gtk
    ../../home/system/wlogout
    ../../home/system/wofi
    ../../home/system/batsignal
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman

  ];

  home = {
    inherit (config.var) username;
    inherit (config.var) homeDirectory;

    packages = with pkgs; [
      # Apps
      discord
      xfce.thunar
      bitwarden
      vlc
      obsidian
      appflowy
      webtorrent_desktop
      epr
      zed-editor

      # Utils
      zip
      unzip
      glow
      optipng
      pfetch
      pandoc
      tiv

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
    ];

    # Import wallpapers into $HOME/wallpapers
    file."wallpapers" = {
      recursive = true;
      source = ../../home/wallpapers;
    };

    # Import my profile picture, used by the hyprpanel dashboard
    file.".profile_picture.png" = { source = ./hikaru.jpg; };

    # Don't touch this
    stateVersion = "24.05";
  };

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        savePath = "/home/faulty/Pictures/screenshots/";
        savePathFixed = true;
        uiColor = "#" + config.var.theme.colors.accent;
      };
    };
  };

  programs.home-manager.enable = true;
}
