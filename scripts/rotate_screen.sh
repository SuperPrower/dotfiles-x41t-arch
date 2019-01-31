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
		xrandr -o right
		xsetwacom set "Serial Wacom Tablet WACf004 stylus" Rotate cw
		xsetwacom set "Serial Wacom Tablet WACf004 eraser" Rotate cw
		;;
	1) # Clockwise portrait
		echo "2" > $rotation_file
		xrandr -o inverted
		xsetwacom set "Serial Wacom Tablet WACf004 stylus" Rotate half
		xsetwacom set "Serial Wacom Tablet WACf004 eraser" Rotate half
		;;
	2) # Upside-down portrait
		echo "3" > $rotation_file
		xrandr -o left
		xsetwacom set "Serial Wacom Tablet WACf004 stylus" Rotate ccw
		xsetwacom set "Serial Wacom Tablet WACf004 eraser" Rotate ccw
		;;
	3) # Counter-clockwise portrait
		echo "0" > $rotation_file
		xrandr -o normal
		xsetwacom set "Serial Wacom Tablet WACf004 stylus" Rotate none
		xsetwacom set "Serial Wacom Tablet WACf004 eraser" Rotate none
		;;
esac

# Restart i3 to re-set wallpaper, restart polybar, etc
i3-msg "restart"
