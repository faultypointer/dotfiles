{ pkgs, ... }:
let
  outputDir = "~/Pictures/Screenshots/";
  screenshootin = pkgs.writeShellScriptBin "screenshootin" ''
    grim -g "$(slurp)" "${outputDir}/screenshot-$(date +%Y%m%d_%H%M%S).png" && swappy -f "${outputDir}/screenshot-$(date +%Y%m%d_%H%M%S).png"
  '';
in { home.packages = [ screenshootin pkgs.slurp pkgs.grim ]; }
