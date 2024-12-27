{
  wayland.windowManager.river.settings.map = {
    normal = {
      "Super Q" = "close";
      "Super Return" = "spawn kitty";
      "Super J" = "focus-view next";
    };
  };
}
# riverctl map normal Super Return spawn kitty
#
# # Super+Q to close the focused view
# # riverctl map normal Super Q close
#
# # Super+Shift+E to exit river
# riverctl map normal Super+Shift E exit
#
# # Super+J and Super+K to focus the next/previous view in the layout stack
# riverctl map normal Super J focus-view next
# riverctl map normal Super K focus-view previous
#
# # Super+Shift+J and Super+Shift+K to swap the focused view with the next/previous
# # view in the layout stack
# riverctl map normal Super+Shift J swap next
# riverctl map normal Super+Shift K swap previous
#
# # Super+Period and Super+Comma to focus the next/previous output
# riverctl map normal Super Period focus-output next
# riverctl map normal Super Comma focus-output previous
#
# # Super+Shift+{Period,Comma} to send the focused view to the next/previous output
# riverctl map normal Super+Shift Period send-to-output next
# riverctl map normal Super+Shift Comma send-to-output previous
#
# # Super+Shift+Return to bump the focused view to the top of the layout stack
# riverctl map normal Super+Shift zoom
#
# # Super+H and Super+L to decrease/increase the main ratio of rivertile(1)
# riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
# riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"
#
# # Super+Shift+H and Super+Shift+L to increment/decrement the main count of rivertile(1)
# riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count +1"
# riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count -1"
#
# # Super+Alt+{H,J,K,L} to move views
# riverctl map normal Super+Alt H move left 100
# riverctl map normal Super+Alt J move down 100
# riverctl map normal Super+Alt K move up 100
# riverctl map normal Super+Alt L move right 100
#
# # Super+Alt+Control+{H,J,K,L} to snap views to screen edges
# riverctl map normal Super+Alt+Control H snap left
# riverctl map normal Super+Alt+Control J snap down
# riverctl map normal Super+Alt+Control K snap up
# riverctl map normal Super+Alt+Control L snap right
#
# # Super+Alt+Shift+{H,J,K,L} to resize views
# riverctl map normal Super+Alt+Shift H resize horizontal -100
# riverctl map normal Super+Alt+Shift J resize vertical 100
# riverctl map normal Super+Alt+Shift K resize vertical -100
# riverctl map normal Super+Alt+Shift L resize horizontal 100
