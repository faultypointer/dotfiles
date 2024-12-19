{ pkgs, ... }: {
  programs.nixvim = {
    plugins.vimtex = {
      enable = true;
      texlivePackage = pkgs.texlive.combined.scheme-full;

      settings = {
        view_method = "sioyek";

        quickfix_enabled = true;
        quickfix_open_on_warning = false;

        quickfix_ignore_filters = [
          "Underfull"
          "Overfull"
          "specifier changed to"
          "Token not allowed in a PDF string"
        ];
      };
    };

    autoCmd = [
      {
        event = [ "BufEnter" "BufWinEnter" ];
        pattern = "*.tex";
        command = ''set filetype=tex "| VimtexTocOpen'';
      }

      {
        event = "User";
        pattern = "VimtexEventInitPost";
        callback = "vimtex#compiler#compile";
      }

      {
        event = "User";
        pattern = "VimtexEventQuit";
        command = "call vimtex#compiler#clean(0)";
      }
    ];
  };
}
