{
	programs.wezterm = {
		enable = true;
		enableBashIntegration = true;
	};
	programs.wezterm.extraConfig = ''
		local wezterm = require 'wezterm'
		local config = wezterm.config_builder()
		config.color_scheme = 'Gruvbox dark, hard (base16)'
		-- config.color_scheme = 'Gruvbox (Gogh)'

		config.hide_tab_bar_if_only_one_tab = true
		config.tab_bar_at_bottom = true
		

		-- config.window_background_opacity = 0.5	

		return config
	'';
}
