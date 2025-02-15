{ variables, ... }: {

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      title = "Ghostty";
      theme = "GruvboxDarkHard";

      background = "000000";
      font-size = 11;
      font-family = "${variables.font.name} Mono";
      mouse-hide-while-typing = true;

      window-padding-x = "4";
      window-decoration = false;
      window-theme = "ghostty";

      linux-cgroup = "single-instance";
      gtk-single-instance = true;
      gtk-tabs-location = "hidden";
      gtk-wide-tabs = false;
      adw-toolbar-style = "flat";

      custom-shader = "/home/${variables.username}/.config/ghostty/shader.glsl";
      keybind = "ctrl+shift+o=toggle_tab_overview";
    };
  };
}
