{ inputs, pkgs, ... }:{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./neovim.nix
    ./keymaps.nix
    ./plugins
  ];

  home.packages = with pkgs; [
      neovide
  ];

  home.file."./.config/neovide/config.toml" = {
    source = ./neovide/config.toml;
  };
}
