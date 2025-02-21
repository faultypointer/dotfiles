{ pkgs, config, lib, variables, ... }:
let
  niri = "${config.programs.niri.package}/bin/niri";
  pidof = lib.getExe' pkgs.procps "pidof";
  systemctl = config.systemd.user.systemctlPath;
in {
  home.file."./.config/swaylock/config" = {
    text = # ini
      ''
        # Size
        indicator-radius=100
        indicator-thickness=5

        # Colors
        inside-color=00000000
        separator-color=00000000
        inside-ver-color=00000000
        inside-clear-color=00000000
        inside-wrong-color=00000000
        line-color=00000000
        line-ver-color=00000000
        line-wrong-color=00000000
        line-clear-color=00000000
        ring-ver-color=00000000
        ring-wrong-color=FF0000
        ring-clear-color=${variables.color.text}
        ring-ver-color=${variables.color.text}
        bs-hl-color=${variables.color.accent}
        key-hl-color=${variables.color.text}
        ring-color=00000000
        text-color=00000000
        text-ver-color=00000000
        text-wrong-color=00000000
        text-clear-color=00000000
      '';
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 120;
        command = "${pidof} swaylock && ${systemctl} suspend";
      }
      {
        timeout = 180;
        command = "${pidof} swaylock || ${niri} msg action spawn -- blurlock";
      }
      {
        timeout = 300;
        command = "${pidof} swaylock && ${systemctl} suspend";
      }
    ];

    events = [
      {
        event = "before-sleep";
        command = "${niri} msg action power-off-monitors";
      }
      {
        event = "after-resume";
        command = "${niri} msg action power-on-monitors";
      }
    ];
  };

  systemd.user.services.swayidle.Unit = lib.mkForce { After = "niri.service"; };
}
