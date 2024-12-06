{ 
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        highlight = {
          use_nvim_cmp_as_default = true;
        };

        nerd_font_variant = "mono";

        accept = {
          auto_brackets = {
            enabled = true;
          };
        };

        trigger = {
          signature_help = {
            enabled = true;
          };
        };

        keymap = {
          "<CR>" = [ "select_and_accept" "fallback" ];
          "<C-n>" = [ "select_next" "fallback" ];
          "<C-p>" = [ "select_prev" "fallback" ];
          "<C-y>" = [ "scroll_documentation_down" ];
          "<C-e>" = [ "scroll_documentation_up" ];
        };

        windows = {
          autocomplete = {
            border = "single";
          };
          documentation = {
            auto_show = true;
            border = "single";
            auto_show_delay_ms = 100;
          };
        };
      };
    };
  };
}
