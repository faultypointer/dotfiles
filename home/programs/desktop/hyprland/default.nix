{
  imports = [
    ./bindings.nix
    ./hyprpaper.nix
    ./mime.nix
    ./waybar.nix

    # other programs
    # ../gtk
    ../../terminal/kitty
    ../../terminal/yazi
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      xwayland.enabled = true;
      general = {
        no_border_on_floating = true;
        gaps_in = 2;
        gaps_out = 4;
      };

      monitor = [ "eDP-2,highres,0x0,1" ",prefered,auto,1" ];
      # monitor = [ ",prefered,auto,1" ];

      decoration = {
        rounding = 2;
        active_opacity = 0.85;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;
      };

      misc = { vfr = true; };

      input.touchpad = { natural_scroll = true; };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      env = [
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "MOZ_ENABLE_WAYLAND,1"
        "ANKI_WAYLAND,1"
        "DISABLE_QT5_COMPAT,0"
        "NIXOS_OZONE_WL,1"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM=wayland,xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "GTK_THEME,FlatColor:dark"
      ];
    };
  };
}
