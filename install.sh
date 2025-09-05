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
	cp -f .bashrc ~/
	cp -f .bashrc ~/.config

	cp -f .gitconfig ~/
	cp -f .gitconfig ~/.config
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
