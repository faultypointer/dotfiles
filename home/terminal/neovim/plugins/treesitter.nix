{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      folding = false;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
      };
    };

    lastplace.enable = true;
  };
}
