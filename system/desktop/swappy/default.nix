{pkgs, ...}:{
    home.packages = with pkgs; [ hyprpaper ];

    home.file.".config/swappy/config".text = ''

	[Default]
	save_dir=$HOME/Pictures/Screenshots
	save_filename_format=screenshot_%Y-%m-%d_%H-%M-%S.png
	show_panel=false
	line_size=4
	text_size=12
	text_font=sans-serif
	paint_mode=brush
	early_exit=true
	fill_shape=false

    '';
}
