#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

broadgrep()
{
	local search=$1
	local file=$2

	grep -i --color=auto $1 $2
}

nvimat()
{
	local arbo=$1
	IFS="/" read -ra files <<< $arbo

	local lastIndex=$(( ${#files[@]} - 1 ))

	for file in "${!files[@]}"; do
		if [[ "$file" -eq "$lastIndex" ]] then
			touch ${files[$file]} &> /dev/null
			nvim ${files[$file]}
		else
			mkdir ${files[$file]} &> /dev/null
			cd ${files[$file]}
		fi
	done
}

alias grepc='GREP_COLORS="ms=01;31" grep --color=auto'
alias ..='cd ..'
alias ls='ls -a --color=auto'
alias ll='ls -al'
alias c='clear'
alias clear='clear; ls'

echo "Bienvenue, $USER"

ls

export PATH=$PATH:~/bin

if [[ "$LOGNAME" -ne "$USER" ]]
then
	PS1='[\u@\h \W]\$ '
else
	PS1='[\h \W]\$ '
fi
