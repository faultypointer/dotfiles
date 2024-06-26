{
     programs.nixvim.plugins = {
	  lsp = {
	       enable = true;

	       servers = {
		   lua-ls.enable = true;
		   nil-ls.enable = true;
		   ccls.enable = true;
		   ltex = {
		       enable = true;
		       settings = { 
			   completionEnabled = true;
		       };
		   };
		   rust-analyzer = {
		       enable = true;
		       installCargo = true;
		       installRustc = true;
		   };
		   # pylsp = {
		   #     enable = true;
		   #     settings.plugins.black.enabled = true;
		   # };
		   typst-lsp = {
			enable = true;
			extraOptions.settings = {
			    exportPdf = "onType";
			};
		   };
		   gopls.enable = true;
		   zls.enable = true;
		   astro.enable = true;
		   tsserver.enable = true;
	       };
	  };

          lsp-format = {
            enable = true;
            lspServersToEnable = [
              "nil-ls"
              "rust-analyzer"
	      "pylsp"
	      "gopls"
	      "ccls"
		  "zls"
		  "typst-lsp"
            ];
          };
     };
}
