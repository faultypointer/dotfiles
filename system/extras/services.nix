{ inputs, ... }:{
  # Light sensor
  hardware.sensor.iio.enable = true;

  # OpenSSH
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Battery
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  services.power-profiles-daemon.enable = false;


  imports = [
    inputs.auto-cpufreq.nixosModules.default
  ];
  # Auto-Cpufreq
  programs.auto-cpufreq.enable = true;
  programs.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      turbo = "auto";
    };

    battery = {
      governor = "powersave";
      turbo = "auto";
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # capslock = esc
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "esc";
        };
      };
    };
  };

}
