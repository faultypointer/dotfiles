{ pkgs, ... }: {
  imports = [
    ../programs/desktop/hyprland
    ../programs/terminal/neovim
    ../programs/terminal/shell

    ../scripts
  ];
  home.username = "faulty";
  home.homeDirectory = "/home/faulty";

  home.packages = with pkgs; [
    fastfetch
    nerd-fonts.fantasque-sans-mono

    sioyek
    zed-editor
    rust-analyzer
    nixd
    nil
    nixfmt-rfc-style
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
