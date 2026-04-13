{
  description = ''
    Hikaru is my personal nixos config based on [Nixy](https://github.com/anotherhadi/nixy).
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    stylix.url = "github:danth/stylix";
    # apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    nixcord.url = "github:kaylorben/nixcord";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # sops-nix = {
    #   url = "github:Mic92/sops-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        hyprcube =
          nixpkgs.lib.nixosSystem {
            # system = "x86_64-linux";
            modules = [
              {
                # nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
                _module.args = { inherit inputs; };
              }
              inputs.nixos-hardware.nixosModules.common-gpu-amd  # https://github.com/NixOS/nixos-hardwar
              inputs.home-manager.nixosModules.home-manager
              inputs.stylix.nixosModules.stylix
              ./hosts/hyprcube/configuration.nix 
            ];
          };
      };
    };
}
