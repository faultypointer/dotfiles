  { pkgs, ... }:
  {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.excludePackages = [ pkgs.xterm ];
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      gnome-connections
      gnome-music
      epiphany
      geary
      yelp
      evince
      simple-scan
      gnome-maps
      gnome-system-monitor
      gnome-contacts
      gnome-initial-setup
    ]);

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  }
