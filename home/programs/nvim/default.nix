{inputs, ...}:
{
    imports = [
    inputs.nixvim.homeManagerModules.nixvim
        ./nvim.nix
        ./colorscheme.nix
    ];
}
