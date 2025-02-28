{ inputs, pkgs, ... }: {
  imports = [ inputs.niri.nixosModules.niri ];

  environment.systemPackages = with pkgs; [ xwayland-satellite ladybird ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  environment.variables.NIXOS_OZONE_WL = "1";
}
