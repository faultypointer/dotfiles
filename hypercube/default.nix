{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ./desktop/hyprland.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hypercube";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  services.flatpak.enable = true;
  programs.nix-ld.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.faulty = {
    isNormalUser = true;
    description = "faulty pointer";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  system.stateVersion = "24.11";

}
