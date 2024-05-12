{ config, pkgs, ... }: {
  home.packages = with pkgs; [ hypridle ];

  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
        ignore_dbus_inhibit = false
	lock_cmd = hyprlock
	before_sleep_cmd = hyprlock
    }

    # Screenlock
    listener {
        timeout = 600
        on-timeout = hyprlock
        on-resume = notify-send "Welcome back!"
    }

    # Suspend (not working on my laptop)
    listener {
        timeout = 660
        on-timeout = systemctl suspend
        on-resume = notify-send "Welcome back to your desktop!"
    }
  '';
}
