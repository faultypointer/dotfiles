{ pkgs, ... }:

let
  increments = "2";

  brightness-change = pkgs.writeShellScriptBin "brightness-change" ''
    sleep 0.05

    [[ $1 == "up" ]] && ${pkgs.brightnessctl}/bin/brightnessctl set ${increments}%+
    [[ $1 == "down" ]] && ${pkgs.brightnessctl}/bin/brightnessctl set ${increments}%-

    brightness_level_uncalculated=$(${pkgs.brightnessctl}/bin/brightnessctl get)
    brightness_level_float=$(echo "scale=2; $brightness_level_uncalculated/255*100" | bc)
    brightness_level=$(printf "%.0f" $brightness_level_float)

    message="󰃠  Brightness: $brightness_level%"
    ${pkgs.libnotify}/bin/notify-send "Brightness $brightness_level%" -h string:x-canonical-private-synchronous:sys-notify -h int:value:"$brightness_level"
  '';

  brightness-up = pkgs.writeShellScriptBin "brightness-up" ''
    brightness-change up ${increments}
  '';

  brightness-down = pkgs.writeShellScriptBin "brightness-down" ''
    brightness-change down ${increments}
  '';

in {
  home.packages = with pkgs; [
    brightness-change
    brightness-up
    brightness-down
    bc
  ];
}
