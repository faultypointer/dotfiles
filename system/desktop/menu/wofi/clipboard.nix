{ pkgs, ... }:

let

  wofi-clipboard = pkgs.writeShellScriptBin "wofi-clipboard" (builtins.readFile ./imgclip);

in {
  home.packages = with pkgs; [
    wofi-clipboard
	wl-clipboard
    cliphist
  ];
}
