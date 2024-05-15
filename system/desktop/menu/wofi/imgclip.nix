{ pkgs, ... }:
let
  imgclip = pkgs.writeShellScriptBin "imgclip" (builtins.readFile ./imgclip);
in {
  home.packages = [
    imgclip
  ];
}
