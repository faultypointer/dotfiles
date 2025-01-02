{
  description = "my's very own nixos flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plugin-markdown = {
      url = "github:MeanderingProgrammer/markdown.nvim";
      flake = false;
    };
    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let variables = import ./home/faulty/variables.nix { inherit inputs; };
    in {
      nixosConfigurations = {
        hypercube = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit self inputs variables; };
          modules = [
            ./hypercube

            home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "HMbackup";
              home-manager.extraSpecialArgs = { inherit inputs variables; };
              home-manager.users.faulty = import ./home/faulty;
            }
          ];
        };
      };
    };
}
