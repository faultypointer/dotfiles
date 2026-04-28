# Nixvim is a NixOS module that installs and configures Neovim
{ pkgs, ... }:
{

  # permanent LSPs:
  home.packages = with pkgs; [
    # nix
    nixd
    nixfmt

    # markdown
    marksman
    harper

    # typst
    tinymist

    #python
    ty
  ];

  programs.helix = {
    enable = true;

    languages = {
      language = [
        {
          name = "typst";
          auto-format = true;
          soft-wrap.wrap-indicator = "";
          language-servers = [
            "tinymist"
            "harper-ls"
          ];
        }
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
          typstExtraArgs = [ "main.typ" ];
          projectResolution = "lockDatabase";
          exportPdf = "onType";
          outputPath = "$root/out/notes.pdf";
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
      # this to set a keybind used to pin the current buffer file as main
      # don't even know if this works or not
      # keys.normal = {
      #   "C-p" = '':lsp-workspace-command tinymist.pinMain "%sh{realpath %{buffer_name}}"'';
      # };
      editor = {
        default-yank-register = "+";
        soft-wrap.enable = true;
      };
    };
  };
}
