{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    # valent
    kdePackages.tokodon
    # halloy
    # cinny-desktop
    webtorrent_desktop
  ]);


  imports = [
    ./keybindings.nix
    ./theme.nix
  ];

}

