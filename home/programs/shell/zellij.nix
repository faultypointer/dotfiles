{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      default_layout = "compact";

      ui = {
        pane_frames = {
          hide_session_name = true;
          rounded_corners = true;
        };
      };
      theme = "hikaru";

      themes = {
        hikaru = {
          fg = "#D8DEE9";
          bg = "#2f72e6"; # replaced with base color from the image
          black = "#3B4252";
          red = "#BF616A";
          green = "#2caae2";
          yellow = "#EBCB8B";
          blue = "#2d6fe7"; # replaced with base color from the image
          magenta = "#3a83e9"; # replaced with base color from the image
          cyan = "#2a6fe4"; # replaced with base color from the image
          white = "#E5E9F0";
          orange = "#D08770";
        };
      };
    };
  };
}
