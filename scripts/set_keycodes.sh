#!/usr/bin/env bash

if (( EUID != 0)); then
	echo "You must be root to do this" 1>&2
	exit 100
else
	setkeycodes 6d 104 # PgUp
	setkeycodes 6e 109 # PgDn

	setkeycodes 69 28 # Enter
	setkeycodes 6b 1 # Escape

	setkeycodes 6c 153 # Rotate
	setkeycodes 68 171 # Toolbox

	setkeycodes 67 184 # XF86Launch5
fi
