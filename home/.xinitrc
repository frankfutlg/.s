#!/usr/bin/env bash

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_SESSION_TYPE="x11"

export XDG_DESKTOP_DIR="$HOME/dsk"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_TEMPLATES_DIR="$HOME/tpts"
export XDG_PUBLICSHARE_DIR="$HOME/pshr"
export XDG_DOCUMENTS_DIR="$HOME/dox"
export XDG_MUSIC_DIR="$HOME/msc"
export XDG_PICTURES_DIR="$HOME/pix"
export XDG_VIDEOS_DIR="$HOME/vids"

xrdb -merge $HOME/.Xresources
xset b off
setxkbmap -layout br
xset r rate 250 60 

initx() {
	export XDG_CURRENT_DESKTOP="awesome"
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
