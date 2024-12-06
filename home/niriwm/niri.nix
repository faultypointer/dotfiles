{ config, pkgs, lib, variables, ... }:{
  home.packages = with pkgs; [
    swayosd
    clipse
  ];
  services.cliphist.enable = true;
  programs.niri.settings = {
    outputs."eDP-1" = {
      scale = 2.0;
      mode.width = 2880;
      mode.height = 1800;
      mode.refresh = 60.001;
    };

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

    hotkey-overlay = {
      skip-at-startup = true;
    };

    prefer-no-csd = true;

    layout = {
      gaps = 4;
      struts.left = 0;
      struts.right = 0;
      border.width = 4;
      always-center-single-column = true;

      focus-ring = {
        width = 0;
      };
    };

    switch-events = {
      lid-close.action.spawn = ["blurred-locker"];
      lid-open.action.spawn =  ["brightnessctl" "set" "100"];
    };

    binds = with config.lib.niri.actions; let
      sh = spawn "sh" "-c";
    in {
      "XF86Calculator".action = sh "if pidof gnome-calculator > /dev/null; then kill $(pidof gnome-calculator); else gnome-calculator; fi";

      "XF86AudioRaiseVolume".action = sh "swayosd-client --output-volume +5 --max-volume 100";
      "XF86AudioLowerVolume".action = sh "swayosd-client --output-volume -5 --max-volume 100";
      "XF86AudioMicMute".action = sh "swayosd-client --input-volume mute-toggle";
      "XF86AudioMute".action = sh "swayosd-client --output-volume mute-toggle";

      "Mod+XF86AudioLowerVolume".action = sh "[ $(brightnessctl get) -gt 20 ] && swayosd-client --brightness -5";
      "XF86MonBrightnessDown".action = sh "[ $(brightnessctl get) -gt 20 ] && swayosd-client --brightness -5";
      "Mod+XF86AudioRaiseVolume".action = sh "swayosd-client --brightness +5";
      "XF86MonBrightnessUp".action = sh "swayosd-client --brightness +5";

      "Mod+V".action = sh "kitty --class clipse -e 'clipse'";
      "Mod+Space".action = spawn "wofi" "--show" "drun";
      "Mod+Return".action = spawn "kitty";
      "Alt+Period".action = spawn "${lib.getExe pkgs.bemoji}";

      "Mod+Print".action = screenshot-window;
      "Print".action = screenshot-screen;
      "Mod+Shift+S".action = screenshot;

      "Mod+Comma".action = consume-window-into-column;
      "Mod+Period".action = expel-window-from-column;

      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+R".action = switch-preset-column-width;
      "Mod+Ctrl+R".action = reset-window-height;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Backspace".action = close-window;
      "Mod+F".action = maximize-column;
      "Mod+C".action = center-column;

      "Mod+Shift+Right".action = move-column-right;
      "Mod+Shift+Left".action = move-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Left".action = focus-column-left;

      "Mod+Shift+L".action = move-column-right;
      "Mod+Shift+H".action = move-column-left;
      "Mod+L".action = focus-column-right;
      "Mod+H".action = focus-column-left;

      "Mod+Shift+Down".action = move-window-to-workspace-down;
      "Mod+Shift+Up".action = move-window-to-workspace-up;
      "Mod+Down".action = focus-workspace-down;
      "Mod+Up".action = focus-workspace-up;

      "Mod+Shift+J".action = move-window-to-workspace-down;
      "Mod+Shift+K".action = move-window-to-workspace-up;
      "Mod+J".action = focus-workspace-down;
      "Mod+K".action = focus-workspace-up;

      "Mod+Shift+Tab".action = focus-window-up-or-column-left;
      "Mod+Tab".action = focus-window-down-or-column-right;

      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-height "+10%";
      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";

      "Mod+Shift+E".action = quit { skip-confirmation=true; };
      "Mod+Shift+Slash".action = show-hotkey-overlay;
    };

    spawn-at-startup = [
      {
        command = [
          "${lib.getExe pkgs.gammastep}"
          "-l"
          "26:87"
        ];
      }
      {
        command = [
          "${lib.getExe pkgs.mako}"
        ];
      }
      {
        command = [
          "swayosd-server"
        ];
      }
      {
        command = [
          "clipse"
          "-listen"
        ];
      }
      {
        command = [
          "${lib.getExe pkgs.swaybg}"
          "-m"
          "fill"
          "-i"
          "/home/${variables.username}/Pictures/Wallpapers/stripes.jpg"
        ];
      }
    ];

    animations.shaders.window-resize = ''
      vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
          vec3 coords_next_geo = niri_curr_geo_to_next_geo * coords_curr_geo;

          vec3 coords_stretch = niri_geo_to_tex_next * coords_curr_geo;
          vec3 coords_crop = niri_geo_to_tex_next * coords_next_geo;

          bool can_crop_by_x = niri_curr_geo_to_next_geo[0][0] <= 1.0;
          bool can_crop_by_y = niri_curr_geo_to_next_geo[1][1] <= 1.0;

          vec3 coords = coords_stretch;
          if (can_crop_by_x)
              coords.x = coords_crop.x;
          if (can_crop_by_y)
              coords.y = coords_crop.y;

          vec4 color = texture2D(niri_tex_next, coords.st);

          if (can_crop_by_x && (coords_curr_geo.x < 0.0 || 1.0 < coords_curr_geo.x))
              color = vec4(0.0);
          if (can_crop_by_y && (coords_curr_geo.y < 0.0 || 1.0 < coords_curr_geo.y))
              color = vec4(0.0);

          return color;
      }
    '';

    window-rules = [
      {
        draw-border-with-background = true;
        geometry-corner-radius = let
          r = 8.0;
        in {
          top-left = r;
          top-right = r;
          bottom-left = r;
          bottom-right = r;
        };
        clip-to-geometry = true;
      }
      {
        matches = [{is-focused = false;}];
        opacity = 0.95;
      }
      {
        matches = [{app-id = "^kitty$";}];
        opacity = 1.0;
      }
      {
        matches = [{app-id = "^niri$";}];
        opacity = 1.0;
      }
      {
        matches = [
          {
            app-id = "^kitty$";
            title = ''^\[oxygen\]'';
          }
        ];
        border.active.color = "#FFFFFF";
      }
      {
        matches = [
          {
            app-id = "^firefox$";
            title = "Private Browsing";
          }
        ];
        border.active.color = "#FF0000";
      }
      {
        matches = [
          {
            app-id = "^signal$";
          }
        ];
        block-out-from = "screencast";
      }
    ];

  };
}
