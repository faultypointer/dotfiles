# Nixvim is a NixOS module that installs and configures Neovim
{pkgs, ...}: {

  # permanent LSPs:
  home.packages = with pkgs; [
    nixd
  ];

  programs.helix = {
    enable = true;

    languages = {
      language = [
        {
          name = "nix";
          auto-format = "true";
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
