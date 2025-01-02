{ pkgs, ... }: {
  home.packages = [ pkgs.hyprpaper ];
  wayland.windowManager.hyprland.settings.exec-once =
    [ "${pkgs.hyprpaper}/bin/hyprpaper" ];
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      splash_offset = 2.0;
      preload = [ "~/git/dotfiles/home/wallpapers/current" ]; # TODO
      wallpaper = [ ",~/git/dotfiles/home/wallpapers/current" ]; # TODO
    };
  };
}
