{config, ...}:{
  services.mako = {
    enable = true;
    sort = "-time";
    anchor = "bottom-right";
    layer = "overlay";
    backgroundColor = "#${config.colorScheme.palette.base00}";
    progressColor = "#${config.colorScheme.palette.base0F}";
    width = 300;
    height = 110;
    borderSize = 1;
    borderColor = "#${config.colorScheme.palette.base0B}";
    borderRadius = 8;
    icons = true;
    defaultTimeout = 5000;
    ignoreTimeout = true;
  };
}
