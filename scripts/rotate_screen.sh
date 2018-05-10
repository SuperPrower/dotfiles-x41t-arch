#!/usr/bin/env bash
#
# Script reads current screen rotation value from SCREEN_ROTATION file that is expected to be located within the script folder, and then rotates screen clockwise and back according to it's value

script_dir="$(dirname "$(realpath "$0")")"
rotation_file="$script_dir/SCREEN_ROTATION"

if [ ! -f $rotation_file ]; then
	echo "File $rotation_file doesn't exist, creating one"
	echo "1" > $rotation_file
fi

rotation="$(<"$rotation_file")"

case $rotation in
	0) # Standard landscape
		echo "1" > $rotation_file
		xrandr -o 3
		xsetwacom set "Wacom Serial Penabled Pen stylus" Rotate cw
		xsetwacom set "Wacom Serial Penabled Pen eraser" Rotate cw
		;;
	1) # Clockwise portrait
		echo "0" > $rotation_file
		xrandr -o 0
		xsetwacom set "Wacom Serial Penabled Pen stylus" Rotate none
		xsetwacom set "Wacom Serial Penabled Pen eraser" Rotate none
		;;
esac

# Restart i3 to restart polybar, re-set wallpaper, etc.
i3-msg "restart"
