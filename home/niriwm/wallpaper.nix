{ variables, ... }:{
  programs.wpaperd = {
    enable = true;
    settings = {
      default = {
        path = "/home/${variables.username}/Pictures/Wallpapers/";
        transition.hexagonalize = {
          steps = 50;
        };
      };
    };
  };
}
