{ variables, pkgs, ... }: {
  networking = {
    hostName = variables.hostname;
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 8081 ];
      allowedTCPPortRanges = [{
        from = 1714;
        to = 1764;
      }];
      allowedUDPPortRanges = [{
        from = 1714;
        to = 1764;
      }];
    };
  };

  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${variables.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = variables.username;
    extraGroups = [ "docker" "networkmanager" "wheel" "dialout" "adbusers" "plugdev" ];
  };

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Enable Zsh
  programs.zsh.enable = true;

  # Run unpatched dynamic binaries.
  programs.nix-ld.enable = true;

  # Enable ADB
  programs.adb.enable = true;
  users.groups.plugdev = { };
  services.udev.packages = [ pkgs.android-udev-rules ];
}
