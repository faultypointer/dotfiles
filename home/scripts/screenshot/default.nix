{ pkgs, ... }:

# let
#   screenshot = pkgs.writeShellScriptBin "screenshot" ''
#     if [[ $2 == "swappy" ]];then
#       folder="/tmp"
#     else
#       folder="$HOME/Pictures/screenshots"
#     fi
#     filename="$(date +%Y-%m-%d_%H:%M:%S).png"
#     mode="region" # Default to region
#
#     if [[ $1 == "window" ]];then
#       mode="window"
#     elif [[ $1 == "monitor" ]];then
#       mode="output"
#     fi
#
#     ${pkgs.hyprshot}/bin/hyprshot -m $mode -o $folder -f $filename -s || exit 1
#
#     if [[ $2 == "swappy" ]];then
#       ${pkgs.swappy}/bin/swappy -f "$folder/$filename" -o "$HOME/Pictures/screenshots/$filename"
#       exit 0
#     fi
#
#     message="  Screenshot saved"
#
#     ${pkgs.libnotify}/bin/notify-send "$message" \
#                 --icon="$folder/$filename" \
#                 --replace-id="$(cat "/tmp/nixy-notification" 2>/dev/null || echo 0)" --print-id > "/tmp/nixy-notification"
#   '';
# in { home.packages = [ pkgs.hyprshot screenshot ]; 
#
let

  pishot = pkgs.writeShellScriptBin "pishot" ''
        
        timestamp=$(date +%Y-%m-%d_%H-%M-%S)
        folder="/tmp"
        filename="$folder/$timestamp.png"
        message="Screen Captured"

        function notify() {
    	if [[ -f $filename ]]; then 
    	    notify-send "$message" --icon="$filename"
    	else
    	    exit 1
    	fi
        }

        function grab_window() {
    	local monitors=`hyprctl -j monitors`
    	local clients=`hyprctl -j clients | jq -r '[.[] | select(.workspace.id | contains('$(echo $monitors | jq -r 'map(.activeWorkspace.id) | join(",")')'))]'`
    	local boxes="$(echo $clients | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1]) \(.title)"')"
    	slurp -r <<< "$boxes"
        }

        function capture_region() {
    	local region=$(slurp)
    	grim -g "$region" "$filename"
    	notify
        }

        function capture_window() {
    	selected_window=$(grab_window)
    	grim -g "$selected_window" "$filename"
    	notify
        }

        function capture_display() {
    	grim "$filename"
    	notify
        }

        # Check the argument provided and call the corresponding function
        case "$1" in
    	region)
    	    capture_region
    	    swappy -f "$filename"
    	    ;;
    	window)
    	    capture_window
    	    swappy -f "$filename"
    	    ;;
    	display)
    	    capture_display
    	    swappy -f "$filename"
    	    ;;
    	*)
    	    echo "Usage: $0 {region|window|display}"
    	    exit 1
    	    ;;
        esac

  '';

in { home.packages = with pkgs; [ slurp grim swappy pishot jq ]; }
