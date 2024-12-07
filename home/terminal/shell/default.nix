{ pkgs, ... }: {
  imports = [ ./scripts ./starship.nix ];

  home.packages = with pkgs; [ trash-cli eza bat ];

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
    };

    sessionVariables = { EDITOR = "nvim"; };
  };
}
