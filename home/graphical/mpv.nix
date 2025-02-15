{ pkgs, ... }:{
  programs.mpv = {
    enable = true;

    config = {
      osc = "no";
      border = "no";
    };

    bindings = {
      "ALT+k" = "add sub-scale +0.1";
      "ALT+j" = "add sub-scale -0.1";
    };

    scripts = with pkgs; [
      mpvScripts.modernx 
      mpvScripts.thumbfast
      mpvScripts.webtorrent-mpv-hook
    ];

    scriptOpts = {
      thumbfast = {
        max_height = 200;
        max_width = 200;
        scale_factor = 1;
        overlay_id = 42;
        spawn_first = "no";
        network = "yes";
        audio = "no";
        hwdec = "no";
      };
    };
  };
}

