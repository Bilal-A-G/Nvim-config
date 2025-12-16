#!/bin/bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
eval "$(fzf --bash)"

alias ls='ls --color=auto'

fss() {
	local file
	file=$(sudo find / -type f | fzf --sync --preview "less {1}")
	workingdir=$(dirname "$file")
	[ -n "$file" ] && cd "$workingdir" && sudoedit "$file"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd <"$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

fs() {
	local file
	local workingdir
	file=$(find / -type f 2>/dev/null | fzf --preview "less {1}")
	workingdir=$(dirname "$file")
	[ -n "$file" ] && cd "$workingdir" && nvim "$file"
}

alias cd**='cd $(find / -depth 2>/dev/null | fzf)'

alias ps='pacman -Sql | fzf --preview="pacman -Si {1}" | wl-copy'
alias ips='pacman -Q | fzf --preview="pacman -Qi {1}" | wl-copy'

PROJECTS_SCRIPTS_DIR="/home/Bilal/.config/tmux-sessions/"
sp() {
	local proj_start
	proj_start=$(find "${PROJECTS_SCRIPTS_DIR}" -type f | fzf --preview "less {1}")
	[ -n "$proj_start" ] && source "$proj_start"
}

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export MANPAGER='nvim +Man!'
export EDITOR='nvim'

nt() {
	task add project:"$1" "$2"
}

rt() {
	local task_found
	task_found=$(task rc.verbose=nothing minimal status:pending | fzf)
	[ -n "$task_found" ] &&
		word_array=($task_found) && task "${word_array[0]}" delete
}

ct() {
	local task_found
	task_found=$(task rc.verbose=nothing list status:pending | fzf)
	[ -n "$task_found" ] &&
		word_array=($task_found) && task "${word_array[0]}" "done"
}

todayTxt() {
	echo "
 ████████╗ ██████╗ ██████╗  █████╗ ██╗   ██╗
 ╚══██╔══╝██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝
    ██║   ██║   ██║██║  ██║███████║ ╚████╔╝ 
    ██║   ██║   ██║██║  ██║██╔══██║  ╚██╔╝  
    ██║   ╚██████╔╝██████╔╝██║  ██║   ██║   
    ╚═╝    ╚═════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
	"
}

overdueTxt() {
	echo "
  ██████╗ ██╗   ██╗███████╗██████╗ ██████╗ ██╗   ██╗███████╗
 ██╔═══██╗██║   ██║██╔════╝██╔══██╗██╔══██╗██║   ██║██╔════╝
 ██║   ██║██║   ██║█████╗  ██████╔╝██║  ██║██║   ██║█████╗  
 ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗██║  ██║██║   ██║██╔══╝  
 ╚██████╔╝ ╚████╔╝ ███████╗██║  ██║██████╔╝╚██████╔╝███████╗
  ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚══════╝
"
}

stT() {
	watch -t -c -n 0.1 'script -q -c "bash -i -c todayTxt && task today" /dev/null'
}

stO() {
	watch -t -c -n 0.1 'script -q -c "bash -i -c overdueTxt && task overdue" /dev/null'
}

alias eo='emacsclient --no-wait --alternate-editor="" -c'

alias et='emacsclient -c -a "emacs" -e "(my/open/tasks-and-agenda)"'
