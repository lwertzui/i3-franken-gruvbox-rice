#!/bin/bash
# Function to copy file and create directory if necessary
copy_file() {
    local src=$1
    local dest=$2

    # Create the destination directory if it does not exist
    mkdir -p "$(dirname "$dest")"

    # Copy the file
    if cp "$src" "$dest"; then
        echo "Copying $(basename "$src") to $(dirname "$dest")"
        echo "--> done"
	echo
    else
        echo "Failed to copy $(basename "$src")"
    fi
}

# Get the absolute path of the script directory
SRC_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Script directory: $SCRIPT_DIR"

# Define the destination directory in the user's home directory
DEST_DIR="$HOME/.config"
echo "Destination directory: $DEST_DIR"

# Copy the configuration files
copy_file "$SRC_DIR/configs/.config/*" "$DEST_DIR/"
copy_file "$SRC_DIR/wallpapers/wallpaper.png" "$DEST_DIR/wallpapers/wallpaper.png"

