# Nixvim is a NixOS module that installs and configures Neovim
{ pkgs, ... }:
{

  # permanent LSPs:
  home.packages = with pkgs; [
    nixd
    nixfmt

    marksman
    harper

    tinymist
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

      language-server = {
        tinymist.config = {
          preview.background.enabled = true;
          preview.background.args = [
            "--data-plane-host=127.0.0.1:23635"
            "--invert-colors=never"
            "--open"
          ];
        };
      };

    };

    settings = {
      editor = {
        default-yank-register = "+";
        soft-wrap.enable = true;
      };
    };
  };
}
