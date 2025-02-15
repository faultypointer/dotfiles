{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./superuser.nix
    ./services.nix
    ./packagemanagers.nix
    ./rocm.nix
    ./desktop
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  environment.systemPackages = with pkgs; [ neovim wget curl git wl-clipboard ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
