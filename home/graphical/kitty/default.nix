{variables, ...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "gruvbox-dark";
    settings = {
      font_family = "${variables.fontname} Mono";
      bold_font = "${variables.fontname} Bold";
      italic_font = "${variables.fontname} Italic";
      bold_italic_font = "${variables.fontname} Bold Italic";
      font_size = 11.0;

      hide_window_decorations = "yes";
      close_on_child_death = "yes";
      disable_ligatures = "cursor";

      background = "#000000";

      cursor_shape = "block";
      cursor_blink_interval = "0";
      scrollback_lines = "100000";
      scrollback_pager_history_size = "256";
      copy_on_select = "no";
      open_url_with = "xdg-open";
      enable_audio_bell = "no";

      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
    };
    keybindings = {
      "shift+page_up" = "scroll_page_up";
      "shift+page_down" = "scroll_page_down";
      "ctrl+shift+." = "change_font_size all -2.0";
      "ctrl+shift+," = "change_font_size all +2.0";
      "ctrl+shift+w" = "no_op";
    };
  };
}
