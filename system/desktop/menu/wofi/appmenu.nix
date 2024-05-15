{ config, ... }: {

  programs.wofi = {
    enable = true;

    settings = {
      xoffset = 10;
      yoffset = 10;
      allow_markup = true;
      width = 320;
      show = "drun";
      prompt = "Apps";
      term = "alacritty";
      height = 1015;
      orientation = "vertical";
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };

    style = ''
      * {
        font-family: "FantasqueSansMNerdFont";
        font-weight: 500;
        font-size: 13px;
      }

      #scroll {
        margin-top: 4px;
      }

      #window {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
        border-radius: 4px;
      }

      #outer-box {
        padding: 4px;
      }

      #input {
        background-color: #${config.colorScheme.palette.base00};
        padding: 4px 8px;
	border: none;
	box-shadow: none;
      }

      #img {
        padding-right: 8px;
      }

      #text {
        color: #${config.colorScheme.palette.base09};
      }

      #text:selected {
        color: #${config.colorScheme.palette.base07};
      }

      #entry {
        padding: 6px 10px;
      }

      #entry:selected {
        background-color: #${config.colorScheme.palette.base02};
        color: #${config.colorScheme.palette.base07};
	outline: none;
      }

      #entry:selected * {
        color: #${config.colorScheme.palette.base07};
	outline: none;
      }

      #input,
      #entry:selected, #text {
        border-radius: 4px;
        color: #${config.colorScheme.palette.base07};
      }
    '';
  };
}
