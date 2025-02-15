{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tuba
    fractal
    fragments
    varia
    newsflash
    valent
  ];


  imports = [
    ./keybindings.nix
    ./theme.nix
  ];

}

