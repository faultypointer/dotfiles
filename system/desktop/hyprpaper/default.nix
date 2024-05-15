{pkgs, ...}:{
    home.packages = with pkgs; [ hyprpaper ];

    home.file.".config/hypr/hyprpaper.conf".text = ''
	    preload = ~/dotfiles/system/desktop/hyprpaper/light_peeking_painting.jpg 
	    wallpaper = eDP-1,~/dotfiles/system/desktop/hyprpaper/light_peeking_painting.jpg 
	    splash = false
	    ipc = off
    '';
}
