{ config, lib, ... }: {
  imports = [
    # Choose your theme here:
    ../../themes/hikaru.nix
  ];

  config.var = {
    hostname = "hyprcube";
    username = "faulty";
    configDirectory = "/home/" + config.var.username
      + "/git/dotfiles"; # The path of the nixos configuration directory

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
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
