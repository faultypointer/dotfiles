{ pkgs, ... }: {
  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
      "nmi_watchdog=0"
      # "amdgpu.dcdebugmask=0x10" #DC_DISABLE_PSR
      "amdgpu.dcdebugmask=0x200" # DC_DISABLE_PSR_SU
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        consoleMode = "max";
        enable = true;
        editor = false;

      };
    };
  };
}
