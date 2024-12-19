{ pkgs, ... }:{
  imports = [
      ./firefox
      ./gnome
      ./thunderbird
      ./kitty
      ./sioyek
  ];

  home.packages = with pkgs; [
      signal-desktop
      vesktop
      telegram-desktop

      zed-editor
  ];
}
