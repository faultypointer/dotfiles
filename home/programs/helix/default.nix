{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    # DAP
    lldb # C, Cpp, Zig, Rust

    # LSP
    nil # NIX
    zls # Zig
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "Gruvbox";

      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };

      editor = {
        line-number = "relative";
        mouse = false;
        soft-wrap.enable = true;
        bufferline = "multiple";
      };

      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      editor.lsp = { display-inlay-hints = true; };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      }
      # {
      #   name = "rust";
      #   auto-format = true;
      # }
      # {
      #   name = "python";
      #   auto-format = true;
      # }
      {
        name = "zig";
        auto-format = true;
      }
    ];
  };
}
