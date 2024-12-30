{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./direnv.nix
    ./zoxide.nix
    ./git.nix
    ./lazygit.nix
    ./tmux.nix
    ./eza.nix
    ./fzf.nix
  ];

  home.packages = with pkgs; [ magic-wormhole-rs ];
}
