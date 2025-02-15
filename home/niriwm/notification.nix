{ variables, ... }: {
  home.file."./.config/mako/config" = {
    text = ''
      max-visible=5

      background-color=${variables.color.background}
      text-color=${variables.color.text}
      icon-path=/run/current-system/sw/share/icons/hicolor
      border-color=${variables.color.border}
      width=300
      height=900
      border-size=2
      border-radius=${variables.style.radius.string}

      max-icon-size=75
      font=${variables.font.name} 10

      default-timeout=3000
      ignore-timeout=0
    '';
  };
}
