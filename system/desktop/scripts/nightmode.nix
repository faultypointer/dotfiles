{ pkgs, ... }:

let
  default = "4000";

  nightmode-status = pkgs.writeShellScriptBin "nightmode-status" ''
    [[ -f /tmp/nightmode ]] && echo "active" || echo "inactive"
  '';

  nightmode = pkgs.writeShellScriptBin "nightmode" ''
    if [[ -f /tmp/nightmode ]]; then
      rm /tmp/nightmode
      pkill wlsunset
      message="󰖔  Nightmode Deactivated"
    else
      touch /tmp/nightmode
      ${pkgs.hyprland}/bin/hyprctl dispatch exec "${pkgs.wlsunset}/bin/wlsunset -t ${default}"
      message="󰖔  Nightmode Activated"
    fi
    ${pkgs.libnotify}/bin/notify-send "$message" -h string:x-canonical-private-synchronous:sys-notify
  '';

in { home.packages = with pkgs; [ nightmode  nightmode-status wlsunset ]; }
