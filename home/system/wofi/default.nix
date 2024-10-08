{ config, pkgs, ... }: {

  home.packages = with pkgs; [ wofi-emoji ];

  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      width = 450;
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      term = "foot";
      height = "305px";
      orientation = "vertical";
      halign = "fill";
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
      /** ********** Fonts ********** **/

      * {
        font-family: "${config.var.theme.font}";
        font-weight: 500;
        font-size: ${toString config.var.theme.font-size}px;
      }

      #window {
        background-color: #${config.var.theme.colors.bgalt};
        color: #${config.var.theme.colors.fgalt};
        border-radius: ${toString config.var.theme.rounding}px;
      }

      #outer-box {
        padding: 20px;
      }

      #input {
        background-color: #${config.var.theme.colors.bg};
        border: 0px solid #${config.var.theme.colors.accent};
        padding: 8px 12px;
      }

      #scroll {
        margin-top: 20px;
      }

      #inner-box {}

      #img {
        padding-right: 8px;
      }

      #text {
        color: #${config.var.theme.colors.c7};
      }

      #text:selected {
        color: #${config.var.theme.colors.fg};
      }

      #entry {
        padding: 6px;
      }

      #entry:selected {
        background-color: #${config.var.theme.colors.accent};
        color: #${config.var.theme.colors.accentFg};
      }

      #unselected {}

      #selected {}

      #input,
      #entry:selected {
        border-radius: ${toString config.var.theme.rounding}px;
      }
    '';
  };
}
