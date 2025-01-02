{
  programs.nixvim = {
    enable = true;
    opts = {
      laststatus = 3;
      clipboard = "unnamedplus";
      termguicolors = true;
      fillchars = { eob = " "; };
      shortmess = "tToOCFa";
      cursorline = true;
      cursorlineopt = "number";
      ruler = true;
      number = true;
      relativenumber = true;
      breakindent = true;
      linebreak = true;
      swapfile = false;
      undofile = true;
      cmdheight = 0;
      completeopt = [ "menuone" "noselect" "noinsert" ];
      wildmenu = true;
      pumheight = 10;
      ignorecase = true;
      smartcase = true;
      timeout = false;
      updatetime = 400;
      confirm = false;
      equalalways = false;
      splitbelow = true;
      splitright = true;
      scrolloff = 2;

      # Indenting
      shiftwidth = 2;
      smartindent = true;
      tabstop = 2;
      expandtab = true;
      softtabstop = 2;
      sidescrolloff = 2;

      # Status Line
      statusline = "%#Normal#%=";
    };

    globals = { mapleader = " "; };

    colorschemes.gruvbox = {
      enable = true;
      settings = { transparent_mode = true; };
    };

    highlight = { Normal.bg = "#000000"; };
  };
}
