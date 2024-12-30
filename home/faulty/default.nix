{ pkgs, ... }:
{
  imports = [
    ../programs/desktop/hyprland

    ./git.nix

    ../scripts
  ];
  home.username = "faulty";
  home.homeDirectory = "/home/faulty";

  home.packages = with pkgs; [
    fastfetch
    nerd-fonts.fantasque-sans-mono

    lazygit
    zed-editor
    nixd
    nil
    nixfmt-rfc-style
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
