{ pkgs, ... }:{
  imports = [
    ./shell
    ./direnv
    ./zoxide
    ./git
    ./lazygit
    ./neovim
    # ./ssh
    ./tmux
  ];

  home.packages = with pkgs; [
      magic-wormhole-rs
      signal-cli
  ];
}
