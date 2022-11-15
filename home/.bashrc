# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\w] '

alias ytmp3='yt-dlp --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3 -o "%(title)s.%(ext)s"'
alias ytmp4='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s"'
alias makestall="doas make clean install"
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

export TERMINAL="st"
export BROWSER="firefox"

export VISUAL="vim"
export EDITOR="vim"

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
