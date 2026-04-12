# Hyprpaper is used to set the wallpaper on the system
{
  # The wallpaper is set by stylix
  services.hyprpaper = {
    enable = true;
    settings = {
      # TODO: make wallpaper work
      wallpaper = [ "eDP-1,../../../home/wallpapers/tshd.jpg" ];
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
    };
  };
}
