{ inputs, ... }: {
  username = "faultypointer";
  hostname = "hypercube";
  email = "faultypointer@proton.me";

  font = {
    name = "FantasqueSansM Nerd Font";
    size = 12;
  };

  colors = {
    background = "#000000";
    border = "#3a3b3c";
    text = "#c3c3c3";
    c0 = "1e1e2e"; # black
    c1 = "f38ba8"; # red
    c2 = "a6e3a1"; # green
    c3 = "fab387"; # yellow
    c4 = "2f72e6"; # blue (replaced with base color from image)
    c5 = "3a83e9"; # magenta (replaced with base color from image)
    c6 = "74c7ec"; # cyan
    c7 = "cdd6f4"; # white
    c8 = "313244"; # bright black
    c9 = "eba0ac"; # bright red
    c10 = "94e2d5"; # bright green
    c11 = "f9e2af"; # bright yellow
    c12 = "2d6fe7"; # bright blue (replaced with base color from image)
    c13 = "3577e8"; # bright magenta (replaced with base color from image)
    c14 = "2a6fe4"; # bright cyan (replaced with base color from image)
    c15 = "bac2de"; # bright white

    bg = "0B0B0B";
    fg = "EAF0F5";
    bgalt = "121212";
    fgalt = "EAF0F5";

    accent = "3a83e9"; # accent (replaced with base color from image)
    accentFg = "0B0B0B";
    accentalt =
      "3172e6"; # accent alternative (replaced with base color from image)

    # Should make those automatic
    accentName = "magenta";
    accentNumber = "5";
  };

  style = {
    radius = {
      small = "4";
      string = "8";
      float = 8.0;
      int = 8;
    };
  };
}
