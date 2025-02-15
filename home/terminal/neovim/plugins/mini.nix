{
  programs.nixvim.plugins = {
    mini = {
      enable = true;

      # Mock devicons
      mockDevIcons = true;

      # Configure modules
      modules = {
        pairs = {
          mappings = {
            "<" = {
              action = "closeopen";
              pair = "<>";
              neigh_pattern = "[^\\].";
              register = {cr = false;};
            };
          };
        };

        files = {
          use_as_default_explorer = true;
          windows = {
            max_number = 1000;
            preview = false;
            width_focus = 30;
            width_nofocus = 20;
            width_preview = 25;
          };
        };

        pick = {options = {use_cache = true;};};
        move = {
          mappings = {
            left = "<S-h>";
            right = "<S-l>";
            down = "<S-j>";
            up = "<S-k>";
            line_left = "<S-h>";
            line_right = "<S-l>";
            line_down = "<S-j>";
            line_up = "<S-k>";
          };
        };

        indentscope = {symbol = "┋";};
        ai = {};

        clue = {
          triggers = [
            {
              mode = "n";
              keys = "<Leader>";
            }
            {
              mode = "x";
              keys = "<Leader>";
            }
            {
              mode = "i";
              keys = "<C-x>";
            }
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "x";
              keys = "g";
            }
            {
              mode = "n";
              keys = "'";
            }
            {
              mode = "n";
              keys = "`";
            }
            {
              mode = "x";
              keys = "'";
            }
            {
              mode = "x";
              keys = "`";
            }
            {
              mode = "n";
              keys = "\"";
            }
            {
              mode = "x";
              keys = "\"";
            }
            {
              mode = "i";
              keys = "<C-r>";
            }
            {
              mode = "c";
              keys = "<C-r>";
            }
            {
              mode = "n";
              keys = "<C-w>";
            }
            {
              mode = "n";
              keys = "z";
            }
            {
              mode = "x";
              keys = "z";
            }
          ];
        };

        notify = {
          window = {
            winblend = 0;
          };
        };

        git = {};

        diff = {
          view = {
            style = "sign";
            signs = {
              add = " ";
              change = " ";
              delete = "";
            };
          };
        };

        starter = {
          evaluate_single = false;
          header = ''
          ⠀⠀⢀⣤⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          ⠀⠀⢸⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀
          ⠀⠀⠘⠉⠉⠙⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
          ⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⠀⠀⠀⠀⠀ 
          ⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀
          ⠀⠀⠀⠀⣴⣿⣿⣿⠟⣿⣿⣿⣷⠀⠀⠀⠀
          ⠀⠀⠀⣰⣿⣿⣿⡏⠀⠸⣿⣿⣿⣇⠀⠀⠀
          ⠀⠀⢠⣿⣿⣿⡟⠀⠀⠀⢻⣿⣿⣿⡆⠀⠀
          ⠀⢠⣿⣿⣿⡿⠀⠀⠀⠀⠀⢿⣿⣿⣷⣤⡄
          ⢀⣾⣿⣿⣿⠁⠀⠀⠀⠀⠀⠈⠿⣿⣿⣿⡇
          '';
          items = [];
          footer = "";
        };

        icons = {
          lsp = {
            "function" = {
              glyph = "󰡱";
              hl = "MiniIconsCyan";
            };
          };
        };

        operators = {};
      };
    };
  };
}
