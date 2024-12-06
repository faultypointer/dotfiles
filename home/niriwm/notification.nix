{ variables, ... }: {
  home.file."./.config/mako/config" = {
    text = ''
      max-visible=5

      background-color=#000000
      text-color=#c3c3c3
      icon-path=/run/current-system/sw/share/icons/hicolor
      border-color=#b0b0b0
      width=300
      height=900
      border-size=2
      border-radius=5

      max-icon-size=75
      font=${variables.fontname} 10

      default-timeout=3000
      ignore-timeout=0
    '';
  };
}
