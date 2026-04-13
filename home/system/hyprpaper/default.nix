# Hyprpaper is used to set the wallpaper on the system
{lib, ...}: {
  # The wallpaper is set by stylix
  services.hyprpaper = {
    enable = true;
    settings = {
      # TODO: make wallpaper work
      wallpaper = [ "eDP-1,../../../home/wallpapers/tshd.jpg" ];
      ipc = "on";
      splash = false;
      splash_offset = 2;
    };
  };

  systemd.user.services.hyprpaper.Unit.After =
    lib.mkForce "graphical-session.target";

  wayland.windowManager.hyprland.settings.exec-once = [
    "systemctl --user enable --now hyprpaper.service"
  ];
}
