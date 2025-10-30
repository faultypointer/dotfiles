# Hyprpanel is the bar on top of the screen
# Display informations like workspaces, battery, wifi, ...
{ inputs, config, ... }:
let
  transparentButtons = config.theme.bar.transparentButtons;

  accent = "#${config.lib.stylix.colors.base0D}";
  accent-alt = "#${config.lib.stylix.colors.base03}";
  background = "#${config.lib.stylix.colors.base00}";
  background-alt = "#${config.lib.stylix.colors.base01}";
  foreground = "#${config.lib.stylix.colors.base05}";
  font = "${config.stylix.fonts.serif.name}";
  fontSize = toString config.stylix.fonts.sizes.desktop;

  rounding = config.theme.rounding;
  border-size = config.theme.border-size;

  gaps-out = config.theme.gaps-out;
  gaps-in = config.theme.gaps-in;

  floating = config.theme.bar.floating;
  transparent = config.theme.bar.transparent;
  position = config.theme.bar.position;

  location = config.var.location;
in {

  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    overlay.enable = true;

    layout = {
      "bar.layouts" = {
        "*" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [
            "systray"
            "volume"
            "bluetooth"
            "battery"
            "network"
            "clock"
            "notifications"
          ];
        };
      };
    };

    settings = {
      bar = {
        launcher.icon = "";

        workspaces = {
          show_numbered = false;
          workspaces = 5;
          hideUnoccupied = false;
          numbered_active_indicator = "color";
          monitorSpecific = false;
          applicationIconEmptyWorkspace = "";
          showApplicationIcons = true;
          showWsIcons = true;
        };

        windowtitle.label = true;
        volume.label = false;
        network.truncation_size = 12;
        bluetooth.label = false;
        clock.format = "%a %b %d  %I:%M %p";
        notifications.show_total = true;
        media.show_active_only = true;

        customModules = { updates.pollingInterval = 1440000; };
      };

      menus = {
        clock = {
          weather = {
            location = "${location}";
            unit = "metric";
          };
        };

        dashboard = {
          powermenu = {
            confirmation = false;
            avatar.image = "~/.face.icon";
          };

          shortcuts = {
            left = {
              shortcut1 = {
                icon = "";
                command = "zen";
                tooltip = "Zen";
              };
              shortcut2 = {
                icon = "󰅶";
                command = "caffeine";
                tooltip = "Caffeine";
              };
              shortcut3 = {
                icon = "󰖔";
                command = "night-shift";
                tooltip = "Night-shift";
              };
              shortcut4 = {
                icon = "";
                command = "menu";
                tooltip = "Search Apps";
              };
            };
            right = {
              shortcut1 = {
                icon = "";
                command = "hyprpicker -a";
                tooltip = "Color Picker";
              };
              shortcut3 = {
                icon = "󰄀";
                command = "screenshot region swappy";
                tooltip = "Screenshot";
              };
            };
          };
        };
      };

      theme = {
        font = {
          name = font;
          size = "${fontSize}px";
        };

        bar = {
          outer_spacing = if floating && transparent then "0px" else "8px";
          floating = floating;
          transparent = transparent;
          location = position;
          margin_top =
            if position == "top" then "${toString (gaps-in * 2)}px" else "0px";
          margin_bottom =
            if position == "top" then "0px" else "${toString (gaps-in * 2)}px";
          margin_sides = "${toString gaps-out}px";
          border_radius = "${toString rounding}px";
          background = background
            + (if transparentButtons && transparent then "00" else "");
          dropdownGap = "4.5em";

          buttons = {
            style = "default";
            monochrome = true;
            text = foreground;
            background = (if transparent then background else background-alt)
              + (if transparentButtons then "00" else "");
            icon = accent;
            hover = background;
            padding_x = "0.8rem";
            padding_y = "0.4rem";
            y_margins = if floating && transparent then "0px" else "8px";
            spacing = "0.3em";
            radius = if transparent then
              "${toString rounding}px"
            else
              "${toString (rounding - 8)}px";

            workspaces = {
              hover = accent-alt;
              active = accent;
              available = accent-alt;
              occupied = accent-alt;
            };

            notifications = {
              background = background-alt;
              hover = background;
              total = accent;
              icon = accent;
            };
          };

          menus = {
            monochrome = true;
            background = background;
            cards = background-alt;
            card_radius = "${toString rounding}px";
            label = foreground;
            text = foreground;
            shadow =
              if transparent then "0 0 0 0" else "0px 0px 3px 1px #16161e";

            border = {
              size = "${toString border-size}px";
              color = accent;
              radius = "${toString rounding}px";
            };

            popover = {
              text = foreground;
              background = background-alt;
            };

            listitems.active = accent;
            icons.active = accent;
            switch.enabled = accent;
            check_radio_button.active = accent;

            buttons = {
              default = accent;
              active = accent;
            };

            iconbuttons.active = accent;
            progressbar.foreground = accent;
            slider.primary = accent;

            tooltip = {
              background = background-alt;
              text = foreground;
            };

            dropdownmenu = {
              background = background-alt;
              text = foreground;
            };

            menu.media = {
              background.color = background-alt;
              card = {
                color = background-alt;
                tint = 90;
              };
            };
          };
        };

        notification = {
          border_radius = "${toString rounding}px";
          background = background-alt;
          label = accent;
          border = background-alt;
          text = foreground;
          labelicon = accent;

          actions = {
            background = accent;
            text = foreground;
          };
        };

        osd = {
          enable = true;
          orientation = "vertical";
          location = "left";
          radius = "${toString rounding}px";
          margins = "0px 0px 0px 10px";
          muted_zero = true;
          bar_color = accent;
          bar_overflow_color = accent-alt;
          icon = background;
          icon_container = accent;
          label = accent;
          bar_container = background-alt;
        };
      };

      wallpaper.enable = false;
    };
  };
}
