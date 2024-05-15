{ config, pkgs, ... }: {
  services = {
    network-manager-applet.enable = true;
  };

  home.packages = with pkgs; [
	networkmanagerapplet
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        "margin-top" = 4;
        "margin-left" = 8;
        "margin-right" = 8;
        height = 28;
        modules-left = [ "custom/logo" "hyprland/window" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right =
          [ "tray" "backlight" "wireplumber" "battery" "clock" "custom/caffeine" "custom/power" ];

        "wlr/taskbar" = {
          format = "{icon}";
          "on-click" = "activate";
          "on-click-right" = "fullscreen";

          "icon-size" = 25;
          "tooltip-format" = "{title}";
        };
        "hyprland/window" = {
          "format" = " ={class}= ";
          "max-length" = 30;
          "separate-outputs" = true;
        };

        "hyprland/workspaces" = {
          "on-click" = "activate";
          format = "{icon}";
          "format-icons" = {
            "default" = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "active" = "󱓻";
            "urgent" = "󱓻";
          };
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
          };
        };

        tray = { spacing = 16; };

        clock = {
          "tooltip-format" = "<tt>{calendar}</tt>";
          "format-alt" = "  {:%a, %d %b %Y}";
          format = "󰥔  {:%I:%M %p}";
        };

	wireplumber = {
	    "format" = "{icon}";
	    "format-muted" = "󰝟";
	    "on-click" = "sound-toggle";
	    "format-icons" = ["" "" ""];
	    "tooltip-format" = "{volume}% {icon}";
	};

        "custom/logo" = {
          format = " ";
          tooltip = false;
          on-click = "pgrep wofi && pkill wofi || wofi --show drun";
        };

        battery = {
          format = "{capacity}% {icon}";
          "format-icons" = {
            "charging" = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            "default" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          };
          "format-full" = "󰁹 ";
          interval = 10;
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };

        "custom/power" = {
          format = "󰤆";
          tooltip = false;
          on-click = "powermenu";
        };

        "custom/caffeine" = {
          format = "{icon}";
	  "exec-on-event" = true;
	  interval = 1;
	  "format-icons" = {
	    active = "󰅶";
	    inactive = "󰛊";
	  };
	  "return-type" = "json";
          exec = "caffeine-status";
	  on-click = "caffeine";
        };

        backlight = {
          device = "nvidia_0";
          format = "{icon}";
          "format-icons" = [ " " " " "" "" "" "" "" "" "" ];
	  "tooltip-format" = "{percent}% {icon}";
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: "FantasqueSansMNerdFont";
        color: #${config.colorScheme.palette.base07};
        font-weight: 700;
      }

      window#waybar {
        background-color: ${
          if true then
            "rgba(0, 0, 0, 0)"
          else
            "#${config.colorScheme.palette.base00}"
        };
        transition-property: background-color;
        transition-duration: 0.5s;
        border-radius: 4px;
        font-size: 12px;
      }

      .modules-left, .modules-center, .modules-right {
	border: 1px solid #${config.colorScheme.palette.base02};
        border-radius: 4px;
        background-color: #${config.colorScheme.palette.base00};
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
        color: #${config.colorScheme.palette.base06};
      }

      #workspaces button {
        all: initial; /* Remove GTK theme values (waybar #1351) */
        min-width: 0; /* Fix weird spacing in materia (waybar #450) */
        box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
        padding: 4px 15px;
        margin: 3px 3px;
        border-radius: 4px;
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }

      #workspaces button.active {
        color: #${config.colorScheme.palette.base05};
        background-color: #${config.colorScheme.palette.base02};
      }

      #workspaces button:hover {
       box-shadow: inherit;
       text-shadow: inherit;
       opacity: 0.8;
      }

      #workspaces button.urgent {
        background-color: #${config.colorScheme.palette.base08};
      }

      #window > * {
        font-family: "FantasqueSansMNerdFont";
	padding-right: 6px;
      }

      #memory,
      #custom-power,
      #battery,
      #backlight,
      #wireplumber,
      #network,
      #clock,
      #tray,
      #custom-logo,
      #custom-caffeine,
      #backlight{
        border-radius: 4px;
        margin: 3px 3px;
        padding: 3px 12px;
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }

      #hyprland-window{
        color: #${config.colorScheme.palette.base07};
      }

      #tray menu {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }

      #custom-logo {
/*
 * Show border for all simple text modules when the bar is in a top or bottom position.
 * a=1 b=2 c=2 -> specificity = 122
 */
        font-size: 14px;
        color: #${config.colorScheme.palette.base06};
      }

      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #181825;
        }
      }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
        background-color: #ff0048;
        color: #181825;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #battery.charging {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
        animation: none;
      }

      #custom-power {
        background-color: #${config.colorScheme.palette.base02};
        color: #${config.colorScheme.palette.base05};
      }


      tooltip {
        border-radius: 8px;
        padding: 15px;
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }

      tooltip label {
        padding: 5px;
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }
    '';
  };
}
