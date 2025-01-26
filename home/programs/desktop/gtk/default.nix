{ variables, pkgs, ... }: {

  qt = {
    enable = true;
    platformTheme.name = "gtk2";
    style.name = "gtk2";
  };

  gtk = {
    enable = true;

    theme = { name = "FlatColor"; };

    iconTheme = {
      package = pkgs.moka-icon-theme;
      name = "Moka";
    };

    inherit (variables) font;

    gtk3.extraConfig = { gtk-application-prefer-dark-theme = true; };

    gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
  };

  home.file = {
    ".local/share/themes/FlatColor" = {
      recursive = true;
      source = pkgs.stdenv.mkDerivation {
        name = "FlatColor";

        src = pkgs.fetchFromGitHub {
          owner = "jasperro";
          repo = "FlatColor";
          rev = "0a56c50e8c5e2ad35f6174c19a00e01b30874074";
          hash = "sha256-P8RnYTk9Z1rCBEEMLTVRrNr5tUM/Pc9dsdMtpHd1Y18=";
        };

        buildPhase = ''
          mkdir -p $out
          # delete the default gtk-color-scheme:
          file="./gtk-2.0/gtkrc"
          sed -i '3,29d' $file
          sed -i '3i include "../colors2"' $file

          file="./gtk-3.0/gtk.css"
          sed -i '2,10d' $file
          sed -i '2i @import url("../colors3");' $file

          file="./gtk-3.20/gtk.css"
          sed -i '2,26d' $file
          sed -i '2i @import url("../colors3");' $file

          cp -r . $out 
        '';
      };
    };

    ".local/share/themes/FlatColor/colors2".text = ''
      bg_color:#${variables.colors.bg}
      color0:#${variables.colors.c0}
      color1:#${variables.colors.c1}
      color2:#${variables.colors.c2}
      color3:#${variables.colors.c3}
      color4:#${variables.colors.c4}
      color5:#${variables.colors.c5}
      color6:#${variables.colors.c6}
      color7:#${variables.colors.c7}
      color8:#${variables.colors.c8}
      color9:#${variables.colors.c9}
      color10:#${variables.colors.c10}
      color11:#${variables.colors.c11}
      color12:#${variables.colors.c12}
      color13:#${variables.colors.c13}
      color14:#${variables.colors.c14}
      color15:#${variables.colors.c15}
      text_color:#${variables.colors.fg}
      selected_bg_color:#${variables.colors.accent}
      selected_fg_color:#${variables.colors.accentFg}
      tooltip_bg_color:#${variables.colors.bgalt}
      tooltip_fg_color:#${variables.colors.fgalt}
      titlebar_bg_color:#${variables.colors.bgalt}
      titlebar_fg_color:#${variables.colors.fgalt}
      menu_bg_color:#${variables.colors.bgalt}
      menu_fg_color:#${variables.colors.fgalt}
      link_color:#${variables.colors.accent}
    '';

    ".local/share/themes/FlatColor/colors3".text = ''
      @define-color color0 #${variables.colors.c0};
      @define-color color1 #${variables.colors.c1};
      @define-color color2 #${variables.colors.c2};
      @define-color color3 #${variables.colors.c3};
      @define-color color4 #${variables.colors.c4};
      @define-color color5 #${variables.colors.c5};
      @define-color color6 #${variables.colors.c6};
      @define-color color7 #${variables.colors.c7};
      @define-color color8 #${variables.colors.c8};
      @define-color color9 #${variables.colors.c9};
      @define-color color10 #${variables.colors.c10};
      @define-color color11 #${variables.colors.c11};
      @define-color color12 #${variables.colors.c12};
      @define-color color13 #${variables.colors.c13};
      @define-color color14 #${variables.colors.c14};
      @define-color color15 #${variables.colors.c15};
      @define-color selected_bg_color #${variables.colors.accent};
      @define-color selected_fg_color #${variables.colors.accentFg};

      @define-color bg_color #${variables.colors.bg};
      @define-color fg_color #${variables.colors.fg};
      @define-color base_color @bg_color;
      @define-color text_color @fg_color;
      @define-color text_color_disabled mix(@text_color, @base_color, 0.4);
      @define-color tooltip_bg_color #${variables.colors.bgalt};
      @define-color tooltip_fg_color #${variables.colors.fgalt};
    '';
  };
}
