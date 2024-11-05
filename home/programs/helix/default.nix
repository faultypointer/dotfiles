{config, ...}:
{
    programs.helix.enable = true;
    programs.helix.languages = {
        language = [
            {
                name = "nix";
                auto-format = true;
            }
        ];
    };
    programs.helix.settings = {
        theme = "gruvbox_dark_hard";
        editor = {
            line-number = "relative";
            lsp.display-messages = true;
        };
        keys.normal = {
            space.space = "file_picker";
            space.w = ":w";
            space.q = ":q";
            esc = [ "collapse_selection" "keep_primary_selection" ];
        };
    };
    programs.helix.themes = {
        base16 = let
            transparent = "none";
            gray = "#${config.var.theme.colors.fg}";
            dark-gray = "#${config.var.theme.colors.fgalt}";
            white = "#${config.var.theme.colors.c7}";
            black = "#${config.var.theme.colors.c0}";
            red = "#${config.var.theme.colors.c1}";
            green = "#${config.var.theme.colors.c2}";
            yellow = "#${config.var.theme.colors.c3}";
            orange = "#f49b71";
            blue = "#${config.var.theme.colors.c4}";
            magenta = "#${config.var.theme.colors.c5}";
            cyan = "#${config.var.theme.colors.c6}";
        in {
            "ui.menu" = transparent;
            "ui.menu.selected" = { modifiers = [ "reversed" ]; };
            "ui.linenr" = { fg = gray; bg = dark-gray; };
            "ui.popup" = { modifiers = [ "reversed" ]; };
            "ui.linenr.selected" = { fg = white; bg = black; modifiers = [ "bold" ]; };
            "ui.selection" = { fg = black; bg = blue; };
            "ui.selection.primary" = { modifiers = [ "reversed" ]; };
            "comment" = { fg = gray; };
            "ui.statusline" = { fg = white; bg = dark-gray; };
            "ui.statusline.inactive" = { fg = dark-gray; bg = white; };
            "ui.help" = { fg = dark-gray; bg = white; };
            "ui.cursor" = { modifiers = [ "reversed" ]; };
            "variable" = red;
            "variable.builtin" = orange;
            "constant.numeric" = orange;
            "constant" = orange;
            "attributes" = yellow;
            "type" = yellow;
            "ui.cursor.match" = { fg = yellow; modifiers = [ "underlined" ]; };
            "string" = green;
            "variable.other.member" = red;
            "constant.character.escape" = cyan;
            "function" = blue;
            "constructor" = blue;
            "special" = blue;
            "keyword" = magenta;
            "label" = magenta;
            "namespace" = blue;
            "diff.plus" = green;
            "diff.delta" = yellow;
            "diff.minus" = red;
            "diagnostic" = { modifiers = [ "underlined" ]; };
            "ui.gutter" = { bg = black; };
            "info" = blue;
            "hint" = dark-gray;
            "debug" = dark-gray;
            "warning" = yellow;
            "error" = red;
        };
    };
}
