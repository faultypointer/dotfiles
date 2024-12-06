{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        nixd.enable = true;
        ccls.enable = true;
        # ltex.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        pylsp = {
          enable = true;
        };
      };
    };

    lsp-format = {
      enable = true;
      lspServersToEnable = [
          "nixd"
          "rust_analyzer"
          "pylsp"
          "ccls"
      ];
    };
  };
}

