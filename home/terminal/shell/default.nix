{ pkgs, ... }:
{
  imports = [ ./scripts ];

  home.packages = with pkgs; [
    trash-cli
    eza
  ];

  programs.starship = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      ignoreSpace = false;
      save = 15000;
      share = true;
    };

    shellAliases = {
      ls = "eza";
      rm = "trash";

      # Neovim
      vim = "nvim";
      nivm = "nvim";
      vnim = "nvim";
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
