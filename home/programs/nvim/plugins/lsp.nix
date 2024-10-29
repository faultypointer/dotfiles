{ pkgs, ... }: {
  home.packages = [ pkgs.c3-lsp ];
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        gopls.enable = true;
        nixd.enable = true;
        tailwindcss.enable = true;
        # html.enable = true; # FIXME: broken for some reason
        svelte.enable = true;
        marksman.enable = true;
        rust-analyzer.enable = true;
        ols.enable = true;
        # c3_lsp = {
        #   enable = true;
        #   package = null;
        #   filetypes = [ "c3" "c3i" ];
        #   cmd = [ "c3-lsp" ];
        # };
        zls = {
          enable = true;
          settings = { warn_style = true; };
        };
        ltex = {
          enable = false;
          settings = {
            enabled = false;
            language = "en";
          };
        };
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          golangci_lint.enable = true;
          statix.enable = true;
        };
        formatting = {
          gofmt.enable = true;
          goimports.enable = true;
          nixfmt.enable = true;
          markdownlint.enable = true;
          tidy.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;
        };
      };
    };
  };
}
