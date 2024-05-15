{ pkgs, config, ... }: {

  home.packages = with pkgs; [ hyprlock ];

  xdg.configFile."hypr/hyprlock.conf".text = ''
    background {
        monitor =
        path = $HOME/.config/home-manager/desktop/hyprpaper/light_peeking_painting.jpg
        color = rgb(${config.colorScheme.palette.base00})

        blur_size = 4
        blur_passes = 3
        noise = 0.0117
        contrast = 1.3000
        brightness = 0.8000
        vibrancy = 0.2100
        vibrancy_darkness = 0.0
    }

    input-field {
        monitor =
        size = 250, 50
        outline_thickness = 1
        dots_size = 0.1 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.3 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = rgb(${config.colorScheme.palette.base03})
        inner_color = rgb(${config.colorScheme.palette.base00})
        font_color = rgb(${config.colorScheme.palette.base07})
        fade_on_empty = true
        hide_input = false
        position = 0, 80
        halign = center
        valign = bottom
    }

    # Current time
    label {
        monitor =
        text = cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"
        color = rgb(${config.colorScheme.palette.base07})
        font_size = 64
        font_family = FantasqueSansMono Nerd Font Mono
        position = 0, 16
        halign = center
        valign = center
    }
  '';
}
