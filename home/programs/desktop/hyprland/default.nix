{
  imports = [
    ./bindings.nix

    # other programs
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

      decoration = {
        rounding = 2;
        active_opacity = 0.85;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;
      };

      input.touchpad = { natural_scroll = true; };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
    };
  };
}
