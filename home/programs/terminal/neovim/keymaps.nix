{
  programs.nixvim = {
    enable = true;
    keymaps = [
      # Insert mode movement
      {
        mode = "i";
        key = "<C-h>";
        action = "<Left>";
        options.desc = "Move left in insert mode";
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<Down>";
        options.desc = "Move down in insert mode";
      }
      {
        mode = "i";
        key = "<C-k>";
        action = "<Up>";
        options.desc = "Move up in insert mode";
      }
      {
        mode = "i";
        key = "<C-l>";
        action = "<Right>";
        options.desc = "Move right in insert mode";
      }

      # Exit insert mode
      {
        mode = "i";
        key = "jj";
        action = "<esc>";
        options.desc = "Exit insert mode with jj";
      }
      {
        mode = "i";
        key = "<C-c>";
        action = "<esc>";
        options.desc = "Exit insert mode with Ctrl-c";
      }

      # Normal mode keymaps
      {
        mode = "n";
        key = "<C-c>";
        action = ":noh<CR>";
        options.desc = "Clear search highlights";
      }

      {
        mode = "n";
        key = "<C-s>";
        action = ":update<CR>";
        options.desc = "Save only on new changes";
      }

      # Switching splits
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Switch to left split";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Switch to below split";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Switch to above split";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Switch to right split";
      }

      # Buffer navigation
      {
        mode = "n";
        key = "<Tab>";
        action = ":bnext<CR>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<s-Tab>";
        action = ":bprev<CR>";
        options.desc = "Previous buffer";
      }

      # Resize splits
      {
        mode = "n";
        key = "<A-k>";
        action = ":resize +2<CR>";
        options.desc = "Increase height of split";
      }
      {
        mode = "n";
        key = "<A-j>";
        action = ":resize -2<CR>";
        options.desc = "Decrease height of split";
      }
      {
        mode = "n";
        key = "<A-h>";
        action = ":vertical resize +2<CR>";
        options.desc = "Increase width of split";
      }
      {
        mode = "n";
        key = "<A-l>";
        action = ":vertical resize -2<CR>";
        options.desc = "Decrease width of split";
      }

      # Scrolling
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "Scroll down and center";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "Scroll up and center";
      }

      # Visual mode keymaps
      {
        mode = "v";
        key = "??";
        action = ''y:h <C-R>"<cr>'';
        options.desc = "Show vim help for selected text";
      }
      {
        mode = "v";
        key = "?/";
        action = ''y:/ <C-R>"<cr>'';
        options.desc = "Search buffer for selected text";
      }

      # Mini.pick mappings
      {
        mode = "n";
        key = "<leader>ff";
        action = ":lua require('mini.pick').builtin.files()<CR>";
        options.desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>bs";
        action = ":lua require('mini.pick').builtin.buffers()<CR>";
        options.desc = "Find buffers";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = ":lua require('mini.pick').builtin.resume()<CR>";
        options.desc = "Resume finding";
      }
      {
        mode = "n";
        key = "<leader>fw";
        action = ":lua require('mini.pick').builtin.grep_live()<CR>";
        options.desc = "Grep live";
      }

      # Mini.files and buffer management
      {
        mode = "n";
        key = "<leader>e";
        action = ":lua MiniFiles.open()<CR>";
        options.desc = "Open minifiles";
      }
      {
        mode = "n";
        key = "<leader>bq";
        action = ":lua require('mini.bufremove').delete()<CR>";
        options.desc = "Remove current buffer";
      }

      # TODO and visits mappings
      {
        mode = "n";
        key = "<A-s>";
        action = ":lua require('mini.extra').pickers.visit_paths({ filter = 'todo' })<CR>";
        options.desc = "Add file to todolist";
      }
      {
        mode = "n";
        key = "<A-a>";
        action = ":lua require('mini.visits').add_label('todo')<CR>";
        options.desc = "Remove file from todolist";
      }
      {
        mode = "n";
        key = "<A-A>";
        action = ":lua require('mini.visits').remove_label()<CR>";
        options.desc = "Remove label from file";
      }

      # LSP mappings
      {
        mode = "n";
        key = "<leader>k";
        action = ":lua vim.lsp.buf.hover()<CR>";
        options.desc = "Open LSP hover";
      }
      {
        mode = "n";
        key = "<leader>df";
        action = ":lua vim.diagnostic.open_float()<CR>";
        options.desc = "Open diagnostics float";
      }
      {
        mode = "n";
        key = "dp";
        action = ":lua vim.diagnostic.goto_prev({ float = false })<CR>";
        options.desc = "Goto previous diagnostic";
      }
      {
        mode = "n";
        key = "dn";
        action = ":lua vim.diagnostic.goto_next({ float = false })<CR>";
        options.desc = "Goto next diagnostic";
      }
      {
        mode = "n";
        key = "<leader>ds";
        action = ":lua vim.diagnostic.setloclist()<CR>";
        options.desc = "Add buffer diagnostics to location list";
      }
      {
        mode = "n";
        key = "<leader>ld";
        action = ":lua vim.lsp.buf.definition()<CR>";
        options.desc = "Goto LSP definition";
      }
      {
        mode = "n";
        key = "<leader>lh";
        action = ":lua vim.lsp.buf.declaration()<CR>";
        options.desc = "Goto LSP declaration";
      }
      {
        mode = "n";
        key = "<leader>lt";
        action = ":lua vim.lsp.buf.type_definition()<CR>";
        options.desc = "Goto LSP type definition";
      }
      {
        mode = "n";
        key = "<leader>li";
        action = ":lua vim.lsp.buf.implementation()<CR>";
        options.desc = "Goto LSP implementation";
      }
      {
        mode = "n";
        key = "<leader>lr";
        action = ":lua vim.lsp.buf.references()<CR>";
        options.desc = "Goto LSP references";
      }
      {
        mode = "n";
        key = "<leader>la";
        action = ":lua vim.lsp.buf.code_action()<CR>";
        options.desc = "Open LSP code action";
      }
      {
        mode = "v";
        key = "<leader>la";
        action = ":lua vim.lsp.buf.code_action()<CR>";
        options.desc = "Open LSP code action";
      }
      {
        mode = "n";
        key = "<leader>lf";
        action = ":lua vim.lsp.buf.format({ async = true })<CR>";
        options.desc = "LSP format";
      }
      {
        mode = "n";
        key = "<leader>lc";
        action = ":lua vim.lsp.buf.rename()<CR>";
        options.desc = "LSP rename";
      }
      {
        mode = "i";
        key = "<A-s>";
        action = ":lua vim.lsp.buf.signature_help()<CR>";
        options.desc = "LSP signature help";
      }
      {
        mode = "x";
        key = "<A-s>";
        action = ":lua vim.lsp.buf.signature_help()<CR>";
        options.desc = "LSP signature help";
      }

      # Modes
      {
        mode = "n";
        key = "<leader>tz";
        action = ":ZenMode<CR>";
        options.desc = "Toggle Zen";
      }

      # Git and diagnostic pickers
      {
        mode = "n";
        key = "<leader>gc";
        action = ":lua require('mini.extra').pickers.git_commits()<CR>";
        options.desc = "Show Git commits";
      }
      {
        mode = "n";
        key = "<leader>gh";
        action = ":lua require('mini.extra').pickers.git_hunks()<CR>";
        options.desc = "Show Git hunks";
      }
      {
        mode = "n";
        key = "<leader>dp";
        action = ":lua require('mini.extra').pickers.diagnostic()<CR>";
        options.desc = "Diagnostics picker";
      }

      # ToggleTerm keybindings
      {
        mode = ["t"];
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options.desc = "Exit terminal insert mode";
      }
      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }
      {
        mode = "n";
        key = "<leader>tf";
        action = "<cmd>ToggleTerm direction=vertical<CR>";
        options.desc = "Open vertical terminal split";
      }
      {
        mode = "n";
        key = "<leader>th";
        action = "<cmd>ToggleTerm direction=horizontal<CR>";
        options.desc = "Open horizontal terminal split";
      }
    ];

  };
}
