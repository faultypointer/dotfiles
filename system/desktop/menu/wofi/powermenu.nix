{ pkgs, ... }:

let

  powermenu = pkgs.writeShellScriptBin "powermenu" ''

    entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻  Shutdown\n< Lock"

    selected=$(pgrep wofi && pkill wofi || echo -e $entries | wofi --xoffset=1182 --yoffset=10  --width 100 --height 220 --dmenu --prompt=Power --cache-file /dev/null | awk '{print tolower($2)}')

    case $selected in
      logout)
	hyprctl dispatch exit;;
      suspend)
	exec systemctl suspend;;
      reboot)
	exec systemctl reboot;;
      shutdown)
	exec systemctl poweroff -i;;
      lock)
	exec hyprlock;;
    esac

  '';

in { home.packages = [ powermenu ]; }
