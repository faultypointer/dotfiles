# Nixvim is a NixOS module that installs and configures Neovim
{
  programs.helix = {
    enable = true;

    settings = {
      # TODO: use basecolors from hikaru theme
      # NOTE: stylix may do this for me automatically
      # theme = "gruvbox_dark_hard";
      editor = {
        default-yank-register = "+";
        soft-wrap.enable = true;
      };
    };
  };
}
