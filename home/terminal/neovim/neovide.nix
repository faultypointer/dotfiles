{ pkgs, ... }: {
  home.packages = with pkgs; [ neovide ];

  home.file."./.config/neovide/config.toml" = {
    source = ./neovide/config.toml;
  };

  programs.nixvim.extraConfigLua = ''
    if vim.g.neovide then
      vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
              vim.cmd("cd /home/faulty/git/")
          end
      })
    end
  '';
}
