{ pkgs, ... }:
{
  # Bootloader
  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    consoleLogLevel = 0;
    initrd.verbose = false;

    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
      "nmi_watchdog=0"
      # "amdgpu.dcdebugmask=0x10"
    ];

    loader = {
      systemd-boot.consoleMode = "max";
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      systemd-boot.editor = false;
    };
  };

  # Set Battery Charging Threshold on Boot
  services.udev.extraRules = ''
    ACTION=="add", KERNEL=="asus-nb-wmi", RUN+="${pkgs.bash}/bin/bash -c 'echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold'"
  '';
}
