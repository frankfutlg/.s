#!/usr/bin/env bash

export XDG_SESSION_TYPE="x11"

xrdb -merge "$HOME/.Xresources"
xset b off
setxkbmap -layout br
xset r rate 250 60 

initx() {
	local WM="awesome"
	export XDG_CURRENT_DESKTOP="$WM"
	export WINDOW_MANAGER="$WM"
	exec dbus-run-session $WM
}

if [ "$PWD" = "$HOME" ]; then
	initx
else
	pushd $HOME
	initx
	popd
fi
