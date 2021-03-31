systemhasprogram() {
    [ -x "$(which $1)" ]
}

detectinstallpkg() {
	if systemhasprogram apt-get ; then
		sudo apt install $1
	elif systemhasprogram pacman ; then
		sudo pacman -S $1
	elif systemhasprogram yum ; then
		sudo yum install $1
	elif systemhasprogram dnf ; then
		sudo dnf install $1
	else
		echo 'No package manager found - not installing $1'
	fi;
}

detectinstallpkg rsync

#detectinstallpkg rdiff-backup
#detectinstallpkg timeshift
#detectinstallpkg bup
