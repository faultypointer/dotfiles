{ variables, ... }:

{
  # exec once in hyprpaper.nix
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        reload_style_on_change = true;
        modules-left = [ "custom/notification" "clock" "custom/pacman" "tray" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "group/expand" "bluetooth" "network" "battery" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
          persistent-workspaces = { "*" = [ 1 2 3 4 5 ]; };
        };

        "custom/notification" = {
          tooltip = false;
          format = "";
          on-click = "swaync-client -t -sw";
          escape = true;
        };

        clock = {
          format = "{:%I:%M:%S %p} ";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              months = "<span color='#000000'><b>{}</b></span>";
              weekdays = "<span color='#000000'><b>{}</b></span>";
              today = "<span color='#000000'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "shift_down";
            on-click = "shift_up";
          };
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format-disconnected = "Error";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname}";
          on-click = "kitty nmtui";
        };

        bluetooth = {
          format-on = "󰂯";
          format-off = "BT-off";
          format-disabled = "󰂲";
          format-connected-battery = "{device_battery_percentage}% 󰂯";
          format-alt = "{device_alias}󰂯";
          tooltip-format = ''
            {controller_alias}	{controller_address}

            {num_connections} connected'';
          tooltip-format-connected = ''
            {controller_alias}	{controller_address}

            {num_connections} connected

            {device_enumerate}'';
          tooltip-format-enumerate-connected = ''
            {device_alias}
            {device_address}'';
          tooltip-format-enumerate-connected-battery = ''
            {device_alias}
            {device_address}
            {device_battery_percentage}%'';
          on-click-right = "blueman-manager";
        };

        battery = {
          interval = 1;
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄 ";
          format-alt = "{time} {icon}";
          format-icons = [ "󰁻" "󰁼" "󰁾" "󰂀" "󰂂" "󰁹" ];
        };

        "custom/expand" = {
          format = "";
          tooltip = false;
        };

        "custom/endpoint" = {
          format = "|";
          tooltip = false;
        };

        "group/expand" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            transition-to-left = true;
            click-to-reveal = true;
          };
          modules =
            [ "custom/expand" "cpu" "memory" "temperature" "custom/endpoint" ];
        };

        cpu = {
          format = "󰻠";
          tooltip = true;
        };

        memory = { format = ""; };

        temperature = {
          critical-threshold = 80;
          format = "{icon}";
          format-icons = [ "" "" "" ];
        };

        tray = {
          icon-size = 14;
          spacing = 10;
        };
      };
    };
    style = ''
      * {
          font-size:15px;
          font-family: "${variables.font.name}";
      }
      window#waybar{
          all:unset;
      }
      .modules-left {
          padding:7px;
          margin:5px;
          border-radius:10px;
          background: rgba(50,50,50,.5);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      .modules-center {
          padding:7px;
          margin:5px;
          border-radius:10px;
          background: rgba(50,50,50,.5);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      .modules-right {
          padding:7px;
          margin:5px;
          border-radius:10px;
          background: rgba(50,50,50,.5);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      tooltip {
          background:rgb(50,50,50)
      }
      #clock:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
          transition: all .3s ease;
          color:rgba(150,150,150,.5);
      }
      #custom-notification {
          padding: 0px 5px;
          transition: all .3s ease;
      }
      #clock{
          padding: 0px 5px;
          transition: all .3s ease;
      }
      #custom-pacman{
          padding: 0px 5px;
          transition: all .3s ease;
      }
      #workspaces {
          padding: 0px 5px;
      }
      #workspaces button {
          all:unset;
          padding: 0px 5px;
          color: transparent;
          transition: all .5s ease;
          text-shadow: 0px 0px 1px rgba(0, 0, 0, .5);
      }
      #workspaces button:hover {
          transition: all .5s ease;
          color:transparent;
          text-shadow: 0px 0px 1px rgba(0, 0, 0, .6);
      }
      #workspaces button.active {
          color: white;
          border: none;
          transition: all .5s ease;
      }
      #workspaces button.empty {
          color: transparent;
          border: none;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
      }
      #workspaces button.empty:hover {
          color: transparent;
          border: none;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
      }
      #workspaces button.empty.active {
          color: white;
          border: none;
          transition: all .5s ease;
      }
      #bluetooth{
          padding: 0px 5px;
          transition: all .3s ease;
      }
      #network{
          padding: 0px 5px;
          transition: all .3s ease;
      }
      #battery{
          padding: 0px 5px;
          transition: all .3s ease;

      }
      #battery.charging {
          color: #26A65B;
      }

      #battery.warning:not(.charging) {
          color: #ffbe61;
      }

      #battery.critical:not(.charging) {
          color: #f53c3c;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
      #group-expand{
          padding: 0px 5px;
          transition: all .3s ease; 
      }
      #custom-expand{
          padding: 0px 5px;
          color:rgba(0,0,0,.2);
          text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
          transition: all .3s ease; 
      }
      #custom-expand:hover{
          color:rgba(255,255,255,.2);
          text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
      }
      #custom-colorpicker{
          padding: 0px 5px;
      }
      #cpu,#memory,#temperature{
          padding: 0px 5px;
          transition: all .3s ease; 
      }
      #custom-endpoint{
          color:transparent;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);

      }
      #tray{
          padding: 0px 5px;
          transition: all .3s ease; 
      }
      #tray menu * {
          padding: 0px 5px;
          transition: all .3s ease; 
      }

      #tray menu separator {
          padding: 0px 5px;
          transition: all .3s ease; 
      }
    '';
  };
}
