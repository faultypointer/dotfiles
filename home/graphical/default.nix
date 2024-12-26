{ pkgs, ... }:{
  imports = [
      ./firefox
      ./gnome
      ./thunderbird
      ./kitty
      ./sioyek
      ./zed
  ];

  home.packages = with pkgs; [
      signal-desktop
      vesktop
      telegram-desktop

      eslint
      vtsls
      tailwindcss-language-server
  ];
}
