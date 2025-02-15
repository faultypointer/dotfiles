{ pkgs, ... }:
let
  blurlock = pkgs.writeScriptBin "blurlock" /*bash*/''
    #!/usr/bin/env bash
    dir=/tmp/blurlock

    mkdir -p $dir

    for output in $(niri msg --json outputs | ${pkgs.jq}/bin/jq -r "keys.[]"); do
      image="$dir/$output.png"

    ${pkgs.grim}/bin/grim -o "$output" "$image"
    ${pkgs.imagemagick}/bin/magick "$image" -scale 2% -blur 0x.5 -resize 5000% "$image"

      args+=" -i $output:$image"
    done

    niri msg action do-screen-transition
    ${pkgs.swaylock}/bin/swaylock $args

    rm -r $dir
  '';

in {
  home.packages = [ blurlock ];
}
