{ inputs, ... }: {
  username = "faultypointer";
  hostname = "hypercube";
  email = "faultypointer@proton.me";

  font = { name = "FantasqueSansM Nerd Font"; };

  color = {
    background = "#000000";
    accent = "#3a3b3c";
    border = "#3a3b3c";
    text = "#c3c3c3";
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
