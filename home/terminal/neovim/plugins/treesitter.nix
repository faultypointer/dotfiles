{ pkgs, ... }: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        markdown
        markdown-inline
        latex
      ];

      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      folding = false;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = { enable = true; };
    };

    lastplace.enable = true;
  };
}
