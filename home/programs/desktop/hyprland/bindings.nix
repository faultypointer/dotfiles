{pkgs, ...}:
{
  home.packages = with pkgs; [
    grimblast
    firefox
  ];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = 
      [
	"$mod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
        "$mod, W, exec, flatpak run io.github.zen_browser.zen"
	"$mod, S, exec, grimblast copy area"
      ]
      ++ (
        builtins.concatLists (builtins.genList (i:
	  let ws = i + 1;
	  in [
	    "$mod, code:1${toString i}, workspace, ${toString ws}"
	    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	  ]
	)
	9)
      );
  };
}
