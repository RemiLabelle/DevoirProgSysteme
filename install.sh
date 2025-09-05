#!/bin/bash

installPackage()
{
	local pac=$1
	$pac --version &> /dev/null
	if [[ $? -ne 0 ]] then
		sudo pacman -S $pac
	fi
}

overrideDotfiles()
{
	rm -f ~/.bashrc
	cp .bashrc ~/
}

mkdir -p ~/bin
mkdir -p ~/cegep
mkdir -p ~/projets

installPackage "git"
installPackage "vim"
installPackage "gcc"
installPackage "gdb"
installPackage "python3"
installPackage "python-pip"

overrideDotfiles
