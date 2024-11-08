{
    programs.nixvim = {
    	enable = true;
        clipboard.providers.wl-copy.enable = true;
    	opts = {
    	    incsearch = true; # Incremental search: show match for partly typed search command
    	    inccommand = "split"; # Search and replace: preview changes in quickfix list
    	    ignorecase = true; # When the search query is lower-case, match both lower and upper-case
    	    smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
    	    number = true;
    	    relativenumber = true;
    	    shiftwidth = 4;
    	    tabstop = 4;
    	    numberwidth = 4;
    	    undofile = true;
    	    autoindent =true; # Do clever autoindenting
    	    wrap = true;
    	    linebreak = true; # Wrap lines after words
    	    updatetime = 100; # Faster Completion
    		signcolumn = "yes";
    	    fillchars = {
    		    eob = " ";
    	    };
    	};
    };
}
