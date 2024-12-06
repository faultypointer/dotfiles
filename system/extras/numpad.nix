{ variables, inputs, ...}:

{

  imports = [
    inputs.asus-numberpad-driver.nixosModules.default
  ];

  # For testing and running the driver manually by the user.
  users.users.${variables.username}.extraGroups = [ "i2c" "input" "uinput" ];

  # Enable Asus Numpad Service
  services.asus-numberpad-driver = {
    enable = true;
    waylandDisplay = "wayland-1";
    config = {
      "default_backlight_level" = "0x41";
    };
  };
}
