{ variables, ... }:{
  programs.wofi = {
    enable = true;
    settings = {
      columns = 1;
      height = "45%";
      width = "20%";
      hide_scroll = true;
      insensitive = true;
      layer = "top";
      location = "center";
      no_actions = true;
      orientation = "vertical";
      prompt = "";
    };

    style = /*css*/''
        *{
          all: unset;
          font-family: ${variables.fontname};
          font-size: 11pt;
          font-weight: normal;
          border-radius: 8px;
        }

        #window {
          background: #000000;
          border-radius: 8px;
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

        #entry {
          border-radius: 4px;
          padding: 4px;
        }

        #entry:selected {
          background: #3a3b3c;
        }
    '';
  };
}
