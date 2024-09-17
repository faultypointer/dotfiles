{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      default_layout = "compact";

      ui = {
        pane_frames = {
          hide_session_name = true;
          rounded_corners = true;
        };
      };
    };
  };
}
