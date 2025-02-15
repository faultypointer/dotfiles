{ pkgs, ... }:

let
  plate = pkgs.writeShellScriptBin "plate" (builtins.readFile ./plate.sh);
  threshold = pkgs.writeShellScriptBin "threshold" (builtins.readFile ./threshold.sh);
  batman = pkgs.writeShellScriptBin "batman" (builtins.readFile ./batman.sh);
in
{
  home.packages = with pkgs; [
    skim
    fzf
    gnused
    gawk
    gum

    # bash scripts
    plate
    threshold
    batman
  ];
}
