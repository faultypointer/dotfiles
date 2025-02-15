{variables, ...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "gruvbox-dark";
    settings = {
      font_family = "${variables.font.name} Mono";
      bold_font = "${variables.font.name} Bold";
      italic_font = "${variables.font.name} Italic";
      bold_italic_font = "${variables.font.name} Bold Italic";
      font_size = 11.0;

      hide_window_decorations = "yes";
      close_on_child_death = "yes";
      disable_ligatures = "cursor";
      window_padding_width = 5;

      background = "${variables.color.background}";

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
