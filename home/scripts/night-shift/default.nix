{ pkgs, ... }:

let
  default = "4000";

  night-shift-on = pkgs.writeShellScriptBin "night-shift-on" ''
    ${pkgs.hyprland}/bin/hyprctl dispatch exec "${pkgs.gammastep}/bin/gammastep -O ${default}"
    title="󰖔  Night-Shift Activated"
    description="Night-Shift is now activated! Your screen will be warmer and easier on the eyes."

    notif "night-shift" "$title" "$description"
  '';

  night-shift-off = pkgs.writeShellScriptBin "night-shift-off" ''
    pkill gammastep
    title="󰖕  Night-Shift Deactivated"
    description="Night-Shift is now deactivated! Your screen will return to normal."

    notif "night-shift" "$title" "$description"
  '';

  night-shift = pkgs.writeShellScriptBin "night-shift" ''
    if pgrep gammastep; then
      night-shift-off
    else
      night-shift-on
    fi
  '';

  night-shift-status = pkgs.writeShellScriptBin "night-shift-status" ''
    if [[ $(pgrep gammastep) ]]; then
      echo "1"
    else
      echo "0"
    fi
  '';

  night-shift-status-icon =
    pkgs.writeShellScriptBin "night-shift-status-icon" ''
      if [[ $(pgrep gammastep) ]]; then
        echo "󰖔"
      else
        echo "󰖕"
      fi
    '';
in {
  home.packages = [
    pkgs.gammastep
    night-shift-on
    night-shift-off
    night-shift
    night-shift-status
    night-shift-status-icon
  ];
}
