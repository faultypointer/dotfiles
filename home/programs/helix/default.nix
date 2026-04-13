# Nixvim is a NixOS module that installs and configures Neovim
{ pkgs, ... }:
{

  # permanent LSPs:
  home.packages = with pkgs; [
    nixd
    nixfmt

    marksman
    harper
  ];

  programs.helix = {
    enable = true;

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixfmt";
        }

        {
          name = "markdown";
          soft-wrap.wrap-indicator = "";
          language-servers = [
            "marksman"
            "harper-ls"
          ];
        }
      ];

    };

    settings = {
      editor = {
        default-yank-register = "+";
        soft-wrap.enable = true;
      };
    };
  };
}
