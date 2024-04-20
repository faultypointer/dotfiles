{config, ...}:
{
    programs.nixvim.plugins = {
	bufferline = {
	    enable = true;
	    alwaysShowBufferline = false;
	    bufferCloseIcon = null;
	    showCloseIcon = false;
	    closeIcon = null;
	    themable = true;
	    separatorStyle = "slant";
	    showBufferCloseIcons = false;
	    highlights = {
		background = {
		    bg = "#${config.colorScheme.palette.base00}";
		};
		fill = {
		    bg = "#${config.colorScheme.palette.base00}";
		};
		separator = {
		    bg = "#${config.colorScheme.palette.base00}";
		    fg = "#${config.colorScheme.palette.base00}";
		};
		separatorSelected = {
		    fg = "#${config.colorScheme.palette.base00}";
		};
		separatorVisible = {
		    fg = "#${config.colorScheme.palette.base00}";
		};
	    };
	};
    };
}
