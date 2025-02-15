{ pkgs, ... }:

let
  statusping = pkgs.writeShellScriptBin "statusping" (builtins.readFile ./statusping.sh);
in
{
  home.packages = with pkgs; [
    libnotify

    # bash scripts
    statusping
  ];

  imports = [
    ./locker.nix
    ./logout.nix
  ];
}
