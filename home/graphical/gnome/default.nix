{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    # valent
    kdePackages.tokodon
    # nheko
    webtorrent_desktop
  ]);


  imports = [
    ./keybindings.nix
    ./theme.nix
  ];

}

