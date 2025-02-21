{ variables, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        # mode = "overlay";
        # spacing = 4;
        modules-left = [ "clock" "tray" "niri/workspaces" ];
        modules-right = [ "network" "pulseaudio" "backlight" "battery" ];
        # modules-center = [ "tray" ];

        "niri/workspaces" = {
          all-outputs = true;
          format = "{value}";
        };
        "tray" = {
          icon-size = 21;
          spacing = 10;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " ";
          format-icons = { default = [ " " " " " " ]; };
        };

        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "IP:  {ipaddr}/{cidr}";
          format-linked = "{ifname}  (No IP)";
          format-disconnected = "  Disconnected";
          format-alt = "{ifname}:  {ipaddr}/{cidr}";
          interval = 5;
        };

        "backlight" = { format = "  {percent}%"; };

        "battery" = {
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{icon} {capacity}%";
          format-charging = "  {capacity}%";
          format-icons = [ " " " " " " " " ];
        };

        "clock" = {
          interval = 1;
          format = "  {:%I:%M %p}";
          tooltip-format = "{:%Y-%m-%d | %H:%M:%S}";
        };
      };
    };
    style = # css
      ''
        * {
          font-family: ${variables.font.name};
         	transition-property: background-color;
         	transition-duration: 0.5s;
         }

         @keyframes blink_red {
         	to {
         		background-color: #331f25;
         	}
         }

         .warning {
         	animation-name: blink_red;
         	animation-duration: 1s;
         	animation-timing-function: linear;
         	animation-iteration-count: infinite;
         	animation-direction: alternate;
         }

         window#waybar {
          background: transparent;
         }

         window>box {
         	margin-left: 5px;
         	margin-right: 5px;
         	background-color: transparent;
         }

         #workspaces button {
         	padding-top: 5px;
         	padding-left: 5px;
         	padding-right: 4px;
         	border-radius: 6px;
         	margin-right: 4px;
         	background: ${variables.color.background};
         	color: ${variables.color.border};
          border: 1px solid ${variables.color.border};
         }

         #workspaces button.active {
         	color: #f1f1f1;
         	font-weight: bold;
         }

         #workspaces button.focused {
         	color: #f1f1f1;
         }

         tooltip {
         	background: #1f1f1f;
           border: 1px solid #424242;
         }

         tooltip label {
         	color: #d9e0ee;
         }

         #backlight,
         #clock,
         #pulseaudio,
         #network,
         #battery {
         	margin-left: 4px;
         	padding-top: 1px;
         	padding-left: 10px;
         	padding-right: 10px;
         	border-radius: 6px;
         	background: ${variables.color.background};
         	color: ${variables.color.text};
          border: 1px solid ${variables.color.border};
         } 

        #clock {
        	margin-right: 4px;
        }
      '';
  };
}
