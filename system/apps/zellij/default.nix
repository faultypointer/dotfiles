{
    programs.zellij = {
	enable = true;
	enableBashIntegration = true;
	settings = {
	    # simplified_ui = true;
	    default_layout = "compact";
	    theme = "gruvbox-dark";
	    # pane_frames = false;
	    ui = {
		pane_frames = {
		    hide_session_name = true;
		    rounded_corners = true;
		};
	    };
	};
    };
}
