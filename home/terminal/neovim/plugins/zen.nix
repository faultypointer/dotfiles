{
  programs.nixvim.plugins = {
    zen-mode = {
      enable = true;
      settings = {
        on_close = ''
          function()
            vim.opt.relativenumber = true
            vim.opt.number = true
            vim.opt.signcolumn = "yes:2"
          end
        '';
        on_open = ''
          function()
            vim.opt.relativenumber = false
            vim.opt.number = false
            vim.opt.signcolumn = "no"
          end
        '';
        window = {
          height = 1;
          options = {
            signcolumn = "no";
          };
          width = 0.75;
        };
        plugins = {
          twilight = {
            enabled = true;
          };
          kitty = {
            enabled = true;
            font = "+2";
          };
        };
      };
    };
  };
}
