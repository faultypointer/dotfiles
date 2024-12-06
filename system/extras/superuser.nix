{ variables, pkgs, ... }:
{
  # Define your hostname.
  networking.hostName = variables.hostname;

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  };

  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${variables.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = variables.username;
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
  };

  # Enable Zsh
  programs.zsh.enable = true;

  # Enable ADB
  programs.adb.enable = true;
}
