{ pkgs, ... }: {
  home.packages = with pkgs; [ wl-clipboard grimblast ];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, Q, killactive"
      "$mod, F, fullscreen"
      "$mod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
      "$mod SHIFT, W, exec, flatpak run io.github.zen_browser.zen"
      "$mod, W, exec, firefox"
      "$mod, M, exec, spotify"
      "$mod, D, exec, vesktop"
      "$mod SHIFT, D, exec, flatpak run io.github.equicord.equibop"
      "$mod, S, exec, grimblast copy area"
      "$mod, E, exec, zeditor"
      "$mod, R, exec, sioyek"
    ] ++ (builtins.concatLists (builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod, code:1${toString i}, workspace, ${toString ws}"
        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
      ]) 9));

    bindl = [
      ",XF86AudioMute, exec, sound-toggle" # Toggle Mute
      ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock when closing Lid
    ];

    bindle = [
      ", XF86AudioRaiseVolume, exec, sound-up" # Sound Up
      ", XF86AudioLowerVolume, exec, sound-down" # Sound Down
      ", XF86MonBrightnessUp, exec, brightness-up" # Brightness Up
      ", XF86MonBrightnessDown, exec, brightness-down" # Brightness Down
    ];
  };
}
