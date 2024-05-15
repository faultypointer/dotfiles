{ pkgs, ... }:

let

  pishot = pkgs.writeShellScriptBin "pishot"''
    
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

in { home.packages = with pkgs; [ slurp grim swappy pishot ]; }
