{ pkgs, ... }:{
  imports = [
    ./shell
    ./neovim
    ./direnv.nix
    ./zoxide.nix
    ./git.nix
    ./lazygit.nix
    ./ssh.nix
    ./tmux.nix
    ./eza.nix
    ./fzf.nix
  ];

  home.packages = with pkgs; [
      magic-wormhole-rs
      btop-rocm
  ];
}
