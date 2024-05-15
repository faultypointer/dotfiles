{
  description = "System flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
	url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";


    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {self, nixpkgs, home-manager, nixvim, ...}@inputs : {
    nixosConfigurations.hypercube = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

        specialArgs = { 
			inherit inputs;
		};

      modules = [
        ./configuration.nix



        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
		  home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.faulty = import ./home.nix;
        }
      ];
    };
  };
}

