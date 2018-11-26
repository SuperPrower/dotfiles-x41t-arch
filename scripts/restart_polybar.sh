#!/usr/bin/env bash
# Restart polybar with panel according to screen rotation

script_dir="$(dirname "$(realpath "$0")")"
rotation_file="$script_dir/SCREEN_ROTATION"

# we don't check for rotation file as it should already exist when
# rotate_screen.sh script executed

rotation="$(<"$rotation_file")"

case $rotation in
	0) # Normal
		killall polybar ; polybar -r landscape &
		;;
	[1-3]) # Tablet
		killall polybar ; polybar -r portrait &
		;;
esac
