#!/bin/bash

#define packages list
packages=(
	'nano'
	'wget'
	'net-tools'
)

#loop thru the list of pkgs and show if they are installed
for package in ${packages[@]};
do
	if [ $(which $package) ]
	then
		echo "$package is installed at $(which $package)."
	else
		echo "$package is not installed."
	fi
done

#search each user's home directory for scripts and provide a formatted output
for user in $(ls /home);
do
	for item in $(find /home/$user -iname '*.sh');
	do
		echo -e "Found a script in $user's home folder! \n$item"
	done
done

#loop thru scripts in the scripts folder and change the permissions  to execute
for script in $(ls ~/scripts);
do
	if [ ! -x ~/scripts/$script ]
	then
		chmod +x ~/scripts/$script
	fi
done

# loop thru a group of files and create a hash of each file.
# can change the file directory or create
for file in $(ls ~/Documents/files_for_hashing/);
do
	sha256sum $file
done

