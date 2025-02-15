{ config, pkgs, lib, variables, ... }: {
  home.packages = with pkgs; [ swayosd clipse ];
  programs.niri.settings = {
    outputs."eDP-1" = {
      scale = 1.0;
      mode = {
        width = 1920;
        height = 1080;
        refresh = 60.001;
      };
    };

    environment = { DISPLAY = ":0"; };

    input.mouse.accel-speed = 1.0;

    input.touchpad = {
      tap = true;
      dwt = true;
      natural-scroll = true;
      click-method = "clickfinger";
    };

    cursor = {
      theme = "Adwaita";

      hide-when-typing = true;
      hide-after-inactive-ms = 1000;
    };

    hotkey-overlay = { skip-at-startup = true; };

    prefer-no-csd = true;

    layout = {
      gaps = 4;
      struts.left = 0;
      struts.right = 0;
      border.width = 4;
      always-center-single-column = true;

      focus-ring = {
        width = 1;
        active.color = "${variables.color.border}00";
      };
    };

    switch-events = {
      lid-close.action.spawn = [ "blurlock" ];
      lid-open.action.spawn = [ "brightnessctl" "set" "100" ];
    };

    binds = with config.lib.niri.actions;
      let sh = spawn "sh" "-c";
      in lib.attrsets.mergeAttrsList [
        {
          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;
          "Mod+Ctrl+1".action = move-column-to-workspace 1;
          "Mod+Ctrl+2".action = move-column-to-workspace 2;
          "Mod+Ctrl+3".action = move-column-to-workspace 3;
          "Mod+Ctrl+4".action = move-column-to-workspace 4;
          "Mod+Ctrl+5".action = move-column-to-workspace 5;
          "Mod+Ctrl+6".action = move-column-to-workspace 6;
          "Mod+Ctrl+7".action = move-column-to-workspace 7;
          "Mod+Ctrl+8".action = move-column-to-workspace 8;
          "Mod+Ctrl+9".action = move-column-to-workspace 9;
        }
        {
          "XF86Calculator".action = sh
            "if pidof gnome-calculator > /dev/null; then kill $(pidof gnome-calculator); else gnome-calculator; fi";
          "XF86AudioRaiseVolume".action =
            sh "swayosd-client --output-volume +5 --max-volume 100";
          "XF86AudioLowerVolume".action =
            sh "swayosd-client --output-volume -5 --max-volume 100";
          "XF86AudioMicMute".action =
            sh "swayosd-client --input-volume mute-toggle";
          "XF86AudioMute".action =
            sh "swayosd-client --output-volume mute-toggle";
          "Mod+XF86AudioLowerVolume".action = sh
            "[ $(brightnessctl get) -gt 20 ] && swayosd-client --brightness -5";
          "XF86MonBrightnessDown".action = sh
            "[ $(brightnessctl get) -gt 20 ] && swayosd-client --brightness -5";
          "Mod+XF86AudioRaiseVolume".action =
            sh "swayosd-client --brightness +5";
          "XF86MonBrightnessUp".action = sh "swayosd-client --brightness +5";
        }
        {
          "Mod+Space".action = sh
            "if pidof waybar > /dev/null; then kill $(pidof waybar); else waybar; fi";

          "Mod+V".action = sh "ghostty -e 'clipse'";
          "Alt+Space".action = spawn "wofi" "--show" "drun";
          "Mod+Return".action = spawn "ghostty";
          "Mod+E".action = spawn "neovide";
          "Alt+Shift+L".action = spawn "blurlock";
          "Alt+Period".action = spawn "${lib.getExe pkgs.bemoji}";
        }
        {
          "Mod+Print".action = screenshot-window;
          "Print".action = screenshot-screen;
          "Mod+Shift+S".action = screenshot;
        }
        {
          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          "Mod+Shift+R".action = switch-preset-window-height;
          "Mod+R".action = switch-preset-column-width;
          "Mod+Ctrl+R".action = reset-window-height;
          "Mod+Shift+F".action = fullscreen-window;
          "Mod+Backspace".action = close-window;
          "Mod+F".action = maximize-column;
          "Mod+C".action = center-column;

          "Mod+Escape".action = switch-focus-between-floating-and-tiling;
          "Mod+Ctrl+Escape".action = toggle-window-floating;

          "Mod+Shift+Right".action = move-column-right;
          "Mod+Shift+Left".action = move-column-left;
          "Mod+Right".action = focus-column-right;
          "Mod+Left".action = focus-column-left;

          "Mod+Shift+L".action = move-column-right;
          "Mod+Shift+H".action = move-column-left;
          "Mod+L".action = focus-column-right;
          "Mod+H".action = focus-column-left;

          "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;
          "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;
          "Mod+Down".action = focus-window-or-workspace-down;
          "Mod+Up".action = focus-window-or-workspace-up;

          "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
          "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
          "Mod+J".action = focus-window-or-workspace-down;
          "Mod+K".action = focus-window-or-workspace-up;

          "Mod+Shift+Tab".action = focus-window-up-or-column-left;
          "Mod+Tab".action = focus-window-down-or-column-right;

          "Mod+Shift+Minus".action = set-window-height "-10%";
          "Mod+Shift+Equal".action = set-window-height "+10%";
          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Equal".action = set-column-width "+10%";
        }
        {
          "Alt+Shift+E".action = spawn "wofi-logout";
          "Mod+Shift+Slash".action = show-hotkey-overlay;
        }
      ];

    spawn-at-startup = [
      { command = [ "${lib.getExe pkgs.gammastep}" "-l" "26:87" ]; }
      { command = [ "${lib.getExe pkgs.mako}" ]; }
      { command = [ "swayosd-server" ]; }
      { command = [ "clipse" "-listen" ]; }
      { command = [ "wpaperd" "--daemon" ]; }
    ];

    window-rules = [
      {
        draw-border-with-background = true;
        geometry-corner-radius = let r = variables.style.radius.float;
        in {
          top-left = r;
          top-right = r;
          bottom-left = r;
          bottom-right = r;
        };
        clip-to-geometry = true;
      }
      {
        matches = [{ is-focused = false; }];
        opacity = 0.95;
      }
      {
        matches = [{ app-id = "^kitty$"; }];
        opacity = 1.0;
      }
      {
        matches = [{ app-id = "^niri$"; }];
        opacity = 1.0;
      }
      {
        matches = [{
          app-id = "^kitty$";
          title = "^\\[oxygen\\]";
        }];
        border.active.color = "#FFFFFF";
      }
      {
        matches = [{
          app-id = "^firefox$";
          title = "Private Browsing";
        }];
        border.active.color = "#FF0000";
      }
      {
        matches = [{ app-id = "^signal$"; }];
        block-out-from = "screencast";
      }
      {
        matches = [{ title = "Keyguard"; }];
        max-width = 1000;
        min-width = 1000;
        max-height = 800;
        min-height = 800;
      }
    ];

  };
}
