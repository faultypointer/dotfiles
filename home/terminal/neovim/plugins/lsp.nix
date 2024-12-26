{ pkgs, ... }: {
  home.packages = [ pkgs.c3-lsp ];
  programs.nixvim.extraConfigLua = ''
    require('lspconfig').csharp_ls.setup {
     cmd = { "csharp-ls" }, -- Ensure this points to the Nix-installed binary
     on_attach = on_attach,
     capabilities = capabilities,
    }
  '';
  programs.nixvim.plugins = {
    direnv.enable = true;
    lsp-format = {
      enable = true;
      lspServersToEnable = [ "nixd" "rust_analyzer" "pylsp" "ccls" ];
    };
    lsp = {
      enable = true;
      servers = {
        html.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        cmake.enable = true;
        gopls.enable = true;
        nixd.enable = true;
        pylsp.enable = true;
        marksman.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        ols.enable = true;
        zls = {
          enable = true;
          settings = { warn_style = true; };
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
          # tidy.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;
        };
      };
    };
  };
}
# {
#   programs.nixvim.plugins = {
#     lsp = {
#       enable = true;
#       servers = {
#         lua_ls.enable = true;
#         nixd.enable = true;
#         ccls.enable = true;
#         # ltex.enable = true;
#         rust_analyzer = {
#           enable = true;
#           installCargo = false;
#           installRustc = false;
#         };
#         pylsp = {
#           enable = true;
#         };
#       };
#     };
#
#     lsp-format = {
#       enable = true;
#       lspServersToEnable = [
#           "nixd"
#           "rust_analyzer"
#           "pylsp"
#           "ccls"
#       ];
#     };
#   };
# }
#
