{ variables, ... }: {
  home.file."./.config/swayosd/style.css" = {
    text = /*css*/''
      window#osd {
        border-radius: ${variables.style.radius.string}px;
        border: 1px solid ${variables.color.border};
        background: ${variables.color.background};
      }

      image,
      label {
        color: #ffffff;
        font-size: 12px;
        font-family: ${variables.font.name};
      }

      #container > image {
        -gtk-icon-transform: scale(0.5);
        margin: 0px;
        padding: 0px;
      }

      #container {
        margin-top: 2px;
        margin-bottom: 2px;
        padding: 0px;
      }

      progress {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: #ffffff;
      }

      progressbar {
        min-height: 5px;
        padding: 0px;
      }
    '';
  };
}
