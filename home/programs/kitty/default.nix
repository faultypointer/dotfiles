{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+t" = "new_tab_with_cwd";
      "ctrl+shift+n" = "new_os_window_with_cwd";
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+]" = "resize_window wider";
      "ctrl+[" = "resize_window narrower";
    };
    settings = {
      scrollback_lines = 10000;
      initial_window_width = 1200;
      initial_window_height = 600;
      update_check_interval = 0;
      enable_audio_bell = false;
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "never";
      url_style = "curly";
      cursor_shape = "Underline";
      cursor_underline_thickness = 3;
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      window_padding_width = 10;

      enabled_layouts = "splits:split_axis=auto";
    };
  };
}
