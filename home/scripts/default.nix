{ pkgs, ... }:

let
  batman = pkgs.writeShellScriptBin "batman" (builtins.readFile ./batman.sh);
in
{
  imports = [
    ./sound.nix
    ./brightness.nix
  ];
  home.packages = with pkgs; [
    skim
    fzf
    gnused
    gawk
    gum

    # bash scripts
    batman
  ];
}
