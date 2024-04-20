{
     programs.nixvim.plugins = {
	  lspsaga = {
	       enable = true;
	       codeAction.keys.quit = "<Esc>";
	       ui.codeAction = "";
	  };
     };

     programs.nixvim.keymaps = [
     {
	  key = "<leader>c";
	  action = ":Lspsaga";
	  options.silent = true;
	  options.desc = "code";
     }
     {
	  key = "<leader>ca";
	  action = ":Lspsaga code_action<CR>";
	  options.silent = true;
	  options.desc = "code action";
     }

     {
	  key = "<leader>cd";
	  action = ":lspsaga show_line_diagnostics<CR>";
	  options.silent = true;
	  options.desc = "show line diagnostics";
     }

     {
	  key = "<leader>cn";
	  action = ":Lspsaga diagnostic_jump_next<CR>";
	  options.silent = true;
	  options.desc = "diagnostic jump next";
     }

     {
	  key = "<leader>cp";
	  action = ":Lspsaga diagnostic_jump_prev<CR>";
	  options.silent = true;
	  options.desc = "diagnostic jump prev";
     }
     ];

}
