{ inputs, ... }:{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./neovim.nix
    ./keymaps.nix
    ./plugins
    ./neovide.nix
  ];

}
