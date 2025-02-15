{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-connections
    gnome-music
    epiphany
    geary
    yelp
    evince
    totem
    simple-scan
    gnome-maps
    gnome-system-monitor
    gnome-contacts
    gnome-initial-setup
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
