{ pkgs, ... }:

let

  tess = pkgs.writeShellScriptBin "tess"''

	if [ -n "$1" ]; then
	  SELECTED_COMMAND="$1"
	else
	  SELECTED_COMMAND=$(printf "rebuild\nexit\nupdate\ngarbage collect" | fzf --border=rounded --layout=reverse --height='40%')
	fi

	function rebuild() {
	  sudo nixos-rebuild switch --flake /home/scientiac/.config/tesseract/nixos/#tesseract
	}

	function update() {
	  sudo nix flake update /home/scientiac/.config/tesseract/nixos/
	}

	function collect_garbage() {
	  sudo nix-collect-garbage -d
	}

	case "$SELECTED_COMMAND" in
	  "rebuild")
	    rebuild
	    ;;
	  "exit")
	    echo "Exiting..."
	    exit
	    ;;
	  "update")
	    update
	    ;;
	  "garbage collect")
	    collect_garbage
	    ;;
	  *)
	    echo "Please input a valid argument."
	    ;;
	esac

  '';

in { home.packages = with pkgs; [ tess fzf ]; }
