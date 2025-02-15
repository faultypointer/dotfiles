{ pkgs, variables, ... }:
let
  wofi-logout = pkgs.writeScriptBin "wofi-logout" # bash
    ''
      #!/usr/bin/env bash
      options="Lock\nLogout\nReboot\nPoweroff\nSuspend\nNextwall"

      choice=$(echo -e "$options" | wofi --dmenu \
        --insensitive \
        --width=50 \
        --lines=7)

      case $choice in
      "Lock")
        blurlock
        ;;
      "Logout")
        loginctl terminate-user ${variables.username}
        ;;
      "Reboot")
        systemctl reboot
        ;;
      "Poweroff")
        systemctl poweroff
        ;;
      "Suspend")
        systemctl suspend
        ;;
      "Nextwall")
        wpaperctl next
        ;;
      *)
        echo "No valid option selected."
        ;;
      esac
    '';

in { home.packages = [ wofi-logout ]; }
