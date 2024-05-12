{ config, pkgs, ... }: {

  home.packages = with pkgs; [ libnotify ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        rounded = "yes";
        origin = "bottom-right";
        monitor = "0";
        alignment = "left";
        vertical_alignment = "center";
        width = "400";
        height = "300";
        scale = 0;
        gap_size = 0;
        progress_bar = true;
        transparency = 20;
        text_icon_padding = 0;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = false;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        corner_radius = 4;
        follow = "mouse";
        font = "FantasqueSansMNerdFont 10";
        format = "<b>%s</b>\\n%b";
        progress_bar_corner_radius = 4;
        frame_color = "#" + config.colorScheme.palette.base0B;
        highlight = "#" + config.colorScheme.palette.base09;
        foreground = "#" + config.colorScheme.palette.base05;
        frame_width = 1;
        offset = "8x8";
        horizontal_padding = 6;
        icon_position = "left";
        indicate_hidden = "yes";
        min_icon_size = 0;
        max_icon_size = 64;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        padding = 5;
        plain_text = "no";
        separator_height = 2;
        show_indicators = "yes";
        shrink = "yes";
        word_wrap = "yes";
        browser = "firefox-devedition";
      };

      fullscreen_delay_everything = { fullscreen = "delay"; };

      urgency_critical = {
        background = "#" + config.colorScheme.palette.base08;
        foreground = "#" + config.colorScheme.palette.base05;
      };
      urgency_low = {
        background = "#" + config.colorScheme.palette.base00;
        foreground = "#" + config.colorScheme.palette.base05;
      };
      urgency_normal = {
        background = "#" + config.colorScheme.palette.base00;
        foreground = "#" + config.colorScheme.palette.base05;
      };
    };
  };
}
