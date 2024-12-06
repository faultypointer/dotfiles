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
      ls = "eza --hyperlink --group-directories-first --icons --color=always";
      rm = "trash";
      cd = "z";

      # Neovim
      vim = "nvim";
      nivm = "nvim";
      vnim = "nvim";
      neovim = "XDG_CONFIG_HOME=/home/scientiac/Einstein/home/terminal/neovim/ nvim";
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
