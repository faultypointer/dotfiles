{
  programs.nixvim = {
    keymaps = [
      {
        action =
          ''<cmd> Telescope find_files search_dirs={"~/Documents/Notes"} <CR>'';
        key = "<leader>of";
        options = { desc = "Find files in second brain"; };
        mode = [ "n" ];
      }
      {
        action =
          ''<cmd> Telescope live_grep search_dirs={"~/Documents/Notes"} <CR>'';
        key = "<leader>og";
        options = { desc = "Search contents in second brain"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd> ObsidianToggleCheckbox <CR>";
        key = "<leader>oc";
        options = { desc = "Toggle checkbox"; };
        mode = [ "n" ];
      }
    ];

    plugins = {
      twilight.enable = true;
      render-markdown.enable = true;
      zen-mode.enable = true;
      markdown-preview.enable = true;

      obsidian = {
        enable = true;
        settings = {
          ui = { enable = false; };
          workspaces = [{
            name = "Notes";
            path = "~/Documents/Notes";
          }];
          dailyNotes = {
            folder = "Journal";
            dateFormat = "%Y-%m-%d";
            aliasFormat = "%B %-d, %Y";
            #template = "daily.md";
          };
          templates = {
            subdir = "templates";
            dateFormat = "%Y-%m-%d";
            timeFormat = "%H:%M";
            substitutions = { };
          };
        };
      };
    };
  };
}
