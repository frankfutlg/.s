#!/usr/bin/env bash

xrdb -merge $HOME/.Xresources
xset b off
setxkbmap -layout br
xset r rate 250 60 

initx() {
	export XDG_CURRENT_DESKTOP="awesome"
	export XDG_SESSION_TYPE="x11"
	export WINDOW_MANAGER="awesome"
	exec dbus-run-session awesome
}

if [ "$PWD" = "$HOME" ]; then
	initx
else
	pushd $HOME
	initx
	popd
fi
