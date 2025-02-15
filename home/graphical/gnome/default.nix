{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tuba
    fractal
    fragments
    newsflash
    valent
  ];


  imports = [
    ./keybindings.nix
    ./theme.nix
  ];

}

