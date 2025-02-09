{ pkgs, lib, ... }: {
  imports = [
    ../programs/desktop/hyprland
    ../programs/terminal/neovim
    ../programs/terminal/shell
    ../programs/desktop/firefox
    ../programs/desktop/spicetify.nix

    ../scripts
  ];
  home.username = "faulty";
  home.homeDirectory = "/home/faulty";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" "obsidian" ];

  home.packages = with pkgs; [
    bat
    btop
    unzip
    p7zip
    fastfetch
    nerd-fonts.fantasque-sans-mono
    brave
    vesktop
    webtorrent_desktop

    obsidian
    sioyek
    zed-editor
    rust-analyzer
    nixd
    nil
    nixfmt-rfc-style
    uv
    zrok
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
