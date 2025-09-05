#!/bin/bash

installpackage()
{
	local pac=$1
	$pac --version &> /dev/null
	if [[ $? -ne 0 ]] then
		sudo pacman -S $pac
	fi
}

overridedotfiles()
{
	rm -f ~/.bashrc
	cp .bashrc ~/
}

mkdir -p ~/bin
mkdir -p ~/cegep
mkdir -p ~/projets

installpackage "git"
installpackage "vim"
installpackage "gcc"
installpackage "gdb"
installpackage "python3"
installpackage "python-pip"

overridedotfiles
