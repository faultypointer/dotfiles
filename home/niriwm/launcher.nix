{ variables, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      columns = 1;
      height = "45%";
      width = "20%";
      lines = 10;
      hide_scroll = true;
      allow_images = true;
      insensitive = true;
      layer = "top";
      location = "center";
      no_actions = true;
      orientation = "vertical";
      prompt = "";
    };

    style = # css
      ''
        *{
          all: unset;
          font-family: ${variables.font.name};
          font-size: 11pt;
          font-weight: normal;
          border-radius: ${variables.style.radius.string}px;
        }

        #window {
          background: ${variables.color.background};
          border-radius: ${variables.style.radius.string}px;
          border: 1px solid ${variables.color.border};
        }

        #input {
          margin-bottom: 4px;
          padding: 4px;
        }

        #input > image.left {
          margin-right: 4px;
        }

        #input > image.right  {
          margin-left: 4px;
        }

        #outer-box {
          padding: 4px;
        }

        #img {
          padding-right: 8px;
        }

        #entry {
          border-radius: ${variables.style.radius.small}px;
          padding: 4px;
        }

        #entry:selected {
          background: ${variables.color.accent};
        }
      '';
  };
}
