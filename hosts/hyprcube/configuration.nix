{ config, pkgs, ... }:
{
  imports = [
    # Mostly system related configuration
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    # ../../nixos/grub.nix
    ../../nixos/sddm.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    # ../../nixos/docker.nix
    ../../nixos/podman.nix
    ../../nixos/tailscale.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  boot.kernelModules = [
    "acer-wmi-battery"
  ];
  boot.extraModulePackages = [ pkgs.linuxPackages_latest.acer-wmi-battery ];
  boot.extraModprobeConfig = ''
    options acer-wmi-battery enable_health_mode=1
  '';

  # Don't touch this
  system.stateVersion = "24.05";
}
