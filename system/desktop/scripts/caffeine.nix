{ pkgs, ... }:
let

  caffeine-status = pkgs.writeShellScriptBin "caffeine-status" ''
    if [[ -f /tmp/caffeine ]]; then
        echo '{"text": "󰅶", "alt": "active", "tooltip": "Caffeine Active"}'
    else
        echo '{"text": "󰛊", "alt": "inactive", "tooltip": "Caffeine Inactive"}'
    fi
  '';

  caffeine = pkgs.writeShellScriptBin "caffeine" ''
    if [[ -f /tmp/caffeine ]]; then
      rm /tmp/caffeine
      ${pkgs.hyprland}/bin/hyprctl dispatch exec ${pkgs.hypridle}/bin/hypridle
      message="󰛊  Caffeine Deactivated"
    else
      touch /tmp/caffeine
      pkill hypridle
      message="󰅶 Caffeine Activated"
    fi
    ${pkgs.libnotify}/bin/notify-send "$message" -h string:x-canonical-private-synchronous:sys-notify
  '';

in { home.packages = [ caffeine-status caffeine ]; }
