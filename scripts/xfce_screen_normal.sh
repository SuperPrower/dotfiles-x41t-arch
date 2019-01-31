#!/usr/bin/env bash
#
# Set screen to normal orientation

script_dir="$(dirname "$(realpath "$0")")"
rotation_file="$script_dir/SCREEN_ROTATION"

if [ ! -f $rotation_file ]; then
	echo "File $rotation_file doesn't exist, creating one"
	echo "0" > $rotation_file
fi

rotation="$(<"$rotation_file")"
lockdir=/tmp/rotate.lock

echo "0" > $rotation_file
xrandr -o normal
xsetwacom set "Serial Wacom Tablet WACf004 stylus" Rotate none
xsetwacom set "Serial Wacom Tablet WACf004 eraser" Rotate none
xfconf-query -c xsettings -p /Xft/RGBA -s rgb

rm -rf "$lockdir"
