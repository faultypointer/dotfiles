{ pkgs, ... }:
let
  screenshootin = pkgs.writeShellScriptBin "screenshootin" ''
    grim -g "$(slurp)" - | swappy -f -
  '';
in { home.packages = [ screenshootin pkgs.slurp pkgs.grim ]; }
