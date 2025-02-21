{ pkgs, ... }: {
  imports = [
    ./firefox
    ./gnome
    ./ghostty
    ./mpv.nix
    ./thunderbird.nix
    ./kitty.nix
    ./sioyek.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    signal-desktop
    vesktop
    obsidian
    telegram-desktop
    easyeffects
    brave
    zed-editor
  ];
}
