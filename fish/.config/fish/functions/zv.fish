function zv
    # Define the path to the Zig versions directory
    set zig_dir ~/zig

    # Use fzf to select a version folder
    set selected_version (ls $zig_dir | fzf)

    # Check if a version was selected
    if test -n "$selected_version"
        # Construct the path to the executable
        set zig_executable "$zig_dir/$selected_version/zig"

        # Check if the executable exists
        if test -x "$zig_executable"
            # Update the alias for zig
            alias zig="$zig_executable"
            echo "Zig version changed to: $selected_version"
        else
            echo "Error: Executable not found for $selected_version"
        end
    else
        echo "No version selected."
    end
end
