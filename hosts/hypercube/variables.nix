{ config, ... }: {
  imports = [ ../modules/variables-config.nix ];

  config.var = {
    hostname = "hypercube";
    username = "faulty";
    homeDirectory = "/home/" + config.var.username;
    configDirectory = config.var.homeDirectory + "/.dotfiles/nixos";

    keyboardLayout = "us";

    location = "";
    timeZone = "Asia/Kathmandu";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "faultypointer";
      email = "faultypointer@proton.me";
    };

    autoUpgrade = false;
    autoGarbageCollector = false;


    # Enable tailscale
    tailscale = false;

    # USBGuard
    # If usbguard enabled: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list 
    # of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
    # allow id {id} # device 1...
    usbguard = false;
    usbguardRules = "";

    theme = import ../themes/hikaru.nix; # select your theme here
  };
}
