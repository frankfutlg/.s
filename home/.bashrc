# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment variables
export TERMINAL="st"
export BROWSER="firefox"

export VISUAL="vim"
export EDITOR="vim"

export SUDO_PROMPT="passwd: "

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_DOCUMENTS_DIR="$HOME/dox"
export XDG_MUSIC_DIR="$HOME/msc"
export XDG_PICTURES_DIR="$HOME/pix"
export XDG_VIDEOS_DIR="$HOME/vids"

export XDG_DESKTOP_DIR="$HOME/.useless"
export XDG_TEMPLATES_DIR="$HOME/.useless"
export XDG_PUBLICSHARE_DIR="$HOME/.useless"

# Aliases
alias ytmp3='yt-dlp -x --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" --prefer-ffmpeg -o "%(title)s.%(ext)s"'
alias ytmp4='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s"'
alias mv="mv -v"
alias cp="cp -vr"
alias rm="rm -vri"

if [ $(command -v exa) ]; then
	alias ls="exa --color=always"
	alias la="exa -a --color=always"
	alias ll="exa -la --color=always"
else
	alias ls="ls --color=always"
	alias la="ls -a --color=always"
	alias ll="ls -la --color=always"
fi

# Prompt
PS1='[\w] '

# Path variables
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Utilities
xreloadb () {
	xrdb -merge "$HOME/.Xresources"
	kill -USR1 $(pidof st)
	clear
	neofetch
}
