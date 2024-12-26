{ pkgs, ... }: {
  programs.nixvim = {
    # extraConfigLua = ''
    #   local g_vimtex_compiler_latexmk = {
    #       ["aux_dir"] = "aux",
    #       ["out_dir"] = "out",
    #       ["callback"] = 1,
    #       ["continuous"] = 1,
    #       ["executable"] = "latexmk",
    #       ["hooks"] = {},
    #       ["options"] = {
    #           "-verbose",
    #           "-file-line-error",
    #           "-synctex=1",
    #           "-interaction=nonstopmode"
    #       }
    #   }
    #
    #   vim.g.vimtex_compiler_latexmk = g_vimtex_compiler_latexmk
    # '';

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
        callback = "vimtex#compiler#clean(0)";
      }
    ];
  };
}
