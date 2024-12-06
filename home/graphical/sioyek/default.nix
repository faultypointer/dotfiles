{ variables, ... }:{
  programs.sioyek = {
    enable = true;
    config = {
      ui_font = "${variables.fontname}";
      startup_commands = "toggle_statusbar";
    };
  };
}
