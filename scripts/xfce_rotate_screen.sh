#!/usr/bin/env bash
#
# Script reads current screen rotation value from SCREEN_ROTATION file that is expected to be located within the script folder, and then rotates screen clockwise and back according to it's value

script_dir="$(dirname "$(realpath "$0")")"
rotation_file="$script_dir/SCREEN_ROTATION"

if [ ! -f $rotation_file ]; then
	echo "File $rotation_file doesn't exist, creating one"
	echo "0" > $rotation_file
fi

rotation="$(<"$rotation_file")"
lockdir=/tmp/rotate.lock

if mkdir "$lockdir"
then
	case $rotation in
		0) # Standard landscape
			echo "1" > $rotation_file
			xrandr -o right
			xsetwacom set "Wacom Serial Penabled Pen stylus" Rotate cw
			xsetwacom set "Wacom Serial Penabled Pen eraser" Rotate cw
			xfconf-query -c xsettings -p /Xft/RGBA -s rgb
			;;
		1) # Clockwise portrait
			echo "2" > $rotation_file
			xrandr -o inverted
			xsetwacom set "Wacom Serial Penabled Pen stylus" Rotate half
			xsetwacom set "Wacom Serial Penabled Pen eraser" Rotate half
			   xfconf-query -c xsettings -p /Xft/RGBA -s bgr
			;;
		2) # Upside-down landscape
			echo "3" > $rotation_file
			xrandr -o left
			xsetwacom set "Wacom Serial Penabled Pen stylus" Rotate ccw
			xsetwacom set "Wacom Serial Penabled Pen eraser" Rotate ccw
			xfconf-query -c xsettings -p /Xft/RGBA -s vrgb
			;;
		3) # Counter-clockwise portrait
			echo "0" > $rotation_file
			xrandr -o normal
			xsetwacom set "Wacom Serial Penabled Pen stylus" Rotate none
			xsetwacom set "Wacom Serial Penabled Pen eraser" Rotate none
			xfconf-query -c xsettings -p /Xft/RGBA -s rgb
			;;
	esac

	xfwm4 --replace & disown
	xfce4-panel -r

	# remove directory when script finishes
	trap 'rm -rf "$lockdir"' 0
else
	exit 0
fi
