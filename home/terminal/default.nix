{ pkgs, ... }:{
  imports = [
    ./shell
    ./direnv
    ./zoxide
    ./git
    ./lazygit
    ./neovim
    # ./nvim
    ./ssh
    ./tmux
  ];

  home.packages = with pkgs; [
      magic-wormhole-rs
      signal-cli
  ];
}
