{
  wayland.windowManager.river.settings.map = {
    normal = {
      "Super Q" = "close";
      "Super Return" = "spawn kitty";
      "Super D" = ''spawn "wofi --show drun"'';

      "Super J" = "focus-view next";
      "Super K" = "focus-view previous";
      "Super+Shift J" = "swap next";
      "Super+Shift K" = "swap previous";

      "Super H" = ''send-layout-cmd rivertile "main-ratio -0.05" '';
      "Super L" = ''send-layout-cmd rivertile "main-ratio +0.05" '';
      "Super+Shift H" = ''send-layout-cmd rivertile "main-count +1" '';
      "Super+Shift L" = ''send-layout-cmd rivertile "main-ratio -1" '';

      "Super+Alt H" = "move left 100";
      "Super+Alt J" = "move down 100";
      "Super+Alt K" = "move up 100";
      "Super+Alt L" = "move right 100";

      "Super+Alt+Control H" = "snap left";
      "Super+Alt+Control J" = "snap down";
      "Super+Alt+Control K" = "snap up";
      "Super+Alt+Control L" = "snap right";

      "Super+Alt+Shift H" = "resize horizontal -100";
      "Super+Alt+Shift J" = "resize vertical 100";
      "Super+Alt+Shift K" = "resize vertical -100";
      "Super+Alt+Shift L" = "resize horizontal 100";

      "Super Period" = "focus-output next";
      "Super Comma" = "focus-focus previous";
      "Super+Shift Period" = "send-to-output next";
      "Super+Shift Comma" = "send-to-output previous";

      "Super+Shift E" = "exit";

      "Super+Shift Z" = "zoom";

    };
  };
}
