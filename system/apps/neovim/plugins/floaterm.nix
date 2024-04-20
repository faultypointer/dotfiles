{
    programs.nixvim.plugins.floaterm = {
	enable = true;
	keymaps = {
	    toggle = "<leader>tt";
	    show = "<leader>ts";
	    hide = "<leader>th";
	    kill = "<leader>tk";
	    next = "<leader>tn";
	    prev = "<leader>tp";
	    last = "<leader>tl";
	    first = "<leader>tf";
	    new = "<leader>to";
	};
    };
}
