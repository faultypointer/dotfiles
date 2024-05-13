{pkgs,config,inputs, ...}: 
let
    hyprbars = inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo;
in
{

  home.packages = with pkgs; [ playerctl ];

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      # hyprbars
    ];

    settings = {
      exec-once = [
	"${pkgs.waybar}/bin/waybar"
	"${pkgs.hyprpaper}/bin/hyprpaper"
	"${pkgs.hypridle}/bin/hypridle"
	"wl-paste --watch cliphist store"
      ];

      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
        # "HDMI-A-1, 2560x1440, 1920x0, 1"
        # ",preferred,auto,1"
      ];

      general = {
	gaps_out = "8";
	gaps_in = "4";
        layout = "dwindle";
        resize_on_border = true;

	"col.active_border" = "rgb(${config.colorScheme.palette.base0B})";
	"col.inactive_border" = "rgb(${config.colorScheme.palette.base02})";
      };

      dwindle = {
        pseudotile = "yes";
        # no_gaps_when_only = "yes";
      };

      misc = {
	disable_hyprland_logo = true;
	disable_splash_rendering = false;
      };

      input = {
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
	workspace_swipe_distance = "400";
	workspace_swipe_cancel_ratio = "0.35";
      };

      "$mod" = "SUPER";
      bind =
        [
          "$mod, Return, exec, alacritty -e zellij"
          "$mod, F, exec, firefox"
		  "$mod, Q, killactive,"
		  ", PRINT, exec, pishot region"
		  "$mod, PRINT, exec, pishot display"
		  "ALT, PRINT, exec, pishot window"
		  "$mod, Space, togglefloating,"
		  "ALT, Space, exec, pgrep wofi && pkill wofi || wofi --show drun"
		  "$mod,L, exec, caffeine"
		  "SUPER_SHIFT, V, exec, wofi-clipboard | wl-copy"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );

      bindle = [
        ", XF86AudioRaiseVolume, exec, sound-up"
        ", XF86AudioLowerVolume, exec, sound-down"
        ", XF86MonBrightnessUp, exec, brightness-up"
        ", XF86MonBrightnessDown, exec, brightness-down"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      bindl = [
        ",XF86AudioMute, exec, pw-volume mute toggle"
        ",switch:Lid Switch, exec, pidof hyprlock || hyprlock"
      ];
       
      bindm = [
	"SUPER, mouse:272, movewindow"
	"SUPER, Control_L, movewindow"
	"SUPER, mouse:273, resizewindow"
	"bindm=SUPER, ALT_L, resizewindow"
      ];

      decoration = {
        rounding = 3;
        dim_inactive = true;
        dim_strength = 0.1;
        drop_shadow = 2;
        shadow_range = 20;
        shadow_render_power = 2;
        "col.shadow" = "rgba(00000044)";
        shadow_offset = "0 0";
        blur = {
          enabled = 1;
          size = 4;
          passes = 4;
          ignore_opacity = 1;
          xray = 1;
          new_optimizations = 1;
          noise = 0.03;
          contrast = 1.0;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

    };
  };
}
