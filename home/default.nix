{ inputs, pkgs, variables, ... }: {
  home-manager.backupFileExtension = "backup";
  home-manager.extraSpecialArgs = { inherit inputs variables; };

  home-manager.users.${variables.username} = {
    home.username = variables.username;
    home.homeDirectory = "/home/${variables.username}";

    home.packages = with pkgs; [ nerd-fonts.fantasque-sans-mono ];

    imports = [
      ./graphical
      ./terminal
      # ./niriwm
    ];

    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  };
}
