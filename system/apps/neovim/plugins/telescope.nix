{
    programs.nixvim = {
	plugins.telescope = {
	    enable = true;

	    keymapsSilent = false;

	    settings.defaults = {
		file_ignore_patterns = [
		    "^.git/"
			"^.mypy_cache/"
			"^__pycache__/"
			"^output/"
			"^data/"
			"%.ipynb"
		];
		set_env.COLORTERM = "truecolor";

		keymaps = {
		    # Find files using Telescope command-line sugar.
		    "<leader>ff" = {
			action = "find_files";
			desc = "find files with telescope";
		    };

		    "<leader>fg" = {
			action = "live_grep";
			desc = "live grep with telescope";
		    };

		    "<leader>bb" = {
			action = "buffers";
			desc = "choose buffers with telescope";
		    };

		    "<leader>fh" = {
			action = "help_tags";
			desc = "help tags with telescope";
		    };

		    "<leader>fd" = {
			action = "diagnostics";
			desc = "diagnostics";
		    };

		    # FZF like bindings
		    "<C-p>" = "git_files";

		    "<leader>p" = {
			action = "oldfiles";
			desc = "oldfiles";
		    };

		    "<C-f>" = "live_grep";
		};
	    };
	};
    };
}
