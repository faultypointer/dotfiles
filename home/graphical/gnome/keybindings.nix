{ pkgs, ... }:{

  home.packages = (with pkgs; [
    gnome-calculator
    brightnessctl
  ]);

  # Calculator Toggle
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      # Empty the default bindings if present
      calculator = [ "''" ];
      calculator-static = [ "''" ];

      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Calculator";
      binding = "XF86Calculator";
      command = "sh -c 'if pidof gnome-calculator > /dev/null; then kill $(pidof gnome-calculator); else gnome-calculator; fi'";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Alacritty";
      binding = "<Super>Return";
      command = "kitty";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Brightness Up";
      binding = "<Super>AudioRaiseVolume";
      command = "brightnessctl set +5%";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Brightness Down";
      binding = "<Super>AudioLowerVolume";
      command = "sh -c '[ $(brightnessctl get) -gt 13 ] && brightnessctl set 5%-'";
    };
  };

}
