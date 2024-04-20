{
    programs.nixvim.keymaps = [
    {
	key = "<leader>bd";
	action = ":bd<CR>";
	options.silent = true;
	options.desc = "buffer destroy";
    }
    {
	key = "<leader>bn";
	action = ":bn<CR>";
	options.silent = true;
	options.desc = "buffer next";
    }

    {
	key = "<leader>bp";
	action = ":bp<CR>";
	options.silent = true;
	options.desc = "buffer previous";
    }

    {
	key = "<leader>ww";
	action = "<C-w>w";
	options.silent = true;
	options.desc = "switch windows";
    }

    {
	key = "<leader>wv";
	action = "<C-w>v";
	options.silent = true;
	options.desc = "vertical split";
    }

    {
	key = "<leader>ws";
	action = "<C-w>s";
	options.silent = true;
	options.desc = "horizontal split";
    }

    {
	key = "<leader>wo";
	action = "<C-w>o";
	options.silent = true;
	options.desc = "close all other windows";
    }

    {
	key = "j";
	action = "gj";
	options.silent = true;
    }

    {
	key = "k";
	action = "gk";
	options.silent = true;
    }
    
    {
	key = "<leader>ff";
	action = ":Telescope find_files";
	options.silent = true;
	options.desc = "find files with telescope";
    }

    {
	key = "<leader>fg";
	action = ":Telescope live_grep";
	options.silent = true;
	options.desc = "live grep with telescope";
    }
    
    {
	key = "<leader>bb";
	action = ":Telescope buffers";
	options.silent = true;
	options.desc = "choose buffers with telescope";
    }
    
    {
	key = "<leader>fh";
	action = ":Telescope help_tags";
	options.silent = true;
	options.desc = "help tags with telescope";
    }

    {
	key = "<leader>fd";
	action = ":Telescope diagnostics";
	options.silent = true;
	options.desc = "diagnostics";
    }


    ];
}
