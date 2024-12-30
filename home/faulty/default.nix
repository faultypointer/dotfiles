{pkgs, ...}:
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
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
