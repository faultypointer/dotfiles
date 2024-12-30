{
  description = "my's very own nixos flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      hypercube = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
	modules = [
	  ./hypercube

	  home-manager.nixosModules.home-manager
	  {
	    home-manager.backupFileExtension = "HMbackup";
	    home-manager.users.faulty = import ./home/faulty;
	  }
	];
      };
    };
  };
}
