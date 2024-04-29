{
    config, ...
}:
{
    programs.nixvim = {
	enable = true;
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
        highlight = {
	    WinSeparator.fg = "#${config.colorScheme.palette.base00}";
	};

	clipboard.register = "unnamedplus";
	globals.mapleader = " ";

	colorschemes.gruvbox = {
	    enable = true;
	    settings = {
		undercurl = true;
		underline = true;
		bold = true;
		italic = {
		    strings = true;
		    emphasis = true;
		    comments = true;
		    operators = false;
		    folds = true;
		};
		strikethrough = true;
		invert_selection = false;
		invert_signs = false;
		invert_tabline = false;
		invert_intend_guides = false;
		inverse = true; #- invert background for search, diffs, statuslines and errors
		palette_overrides = {};
		overrides = {};
		dim_inactive = false;
		transparent_mode = true;
	    };
	};

	colorschemes.base16 = {
	    enable = false;
	    # colorscheme = "gruvbox-dark-hard";
	    colorscheme = "gruvbox-light-soft";
	 #    customColorScheme = {
		# base00 = "#${config.colorScheme.palette.base00}";
		# base01 = "#${config.colorScheme.palette.base01}";
		# base02 = "#${config.colorScheme.palette.base02}";
		# base03 = "#${config.colorScheme.palette.base03}";
		# base04 = "#${config.colorScheme.palette.base04}";
		# base05 = "#${config.colorScheme.palette.base05}";
		# base06 = "#${config.colorScheme.palette.base06}";
		# base07 = "#${config.colorScheme.palette.base07}";
		# base08 = "#${config.colorScheme.palette.base08}";
		# base09 = "#${config.colorScheme.palette.base09}";
		# base0A = "#${config.colorScheme.palette.base0A}";
		# base0B = "#${config.colorScheme.palette.base0B}";
		# base0C = "#${config.colorScheme.palette.base0C}";
		# base0D = "#${config.colorScheme.palette.base0D}";
		# base0E = "#${config.colorScheme.palette.base0E}";
		# base0F = "#${config.colorScheme.palette.base0F}";
	 #    };
	};

    };
}
