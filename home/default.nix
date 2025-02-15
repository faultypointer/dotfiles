{ inputs, pkgs, lib, variables, ... }: {
  home-manager.backupFileExtension = "backup";
  home-manager.extraSpecialArgs = { inherit inputs variables; };

  home-manager.users.${variables.username} = {
    home = {
      homeDirectory = "/home/${variables.username}";
      username = variables.username;
    };

    home.packages = with pkgs; [ nerd-fonts.fantasque-sans-mono ];

    imports = [ ./graphical ./terminal ./niriwm ];

    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [ "obsidian" "spotify" "codeium" ];

    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  };
}
