#!/bin/bash

if [ -e  /swapfile ];
then
echo "SWAP Already exists. Quitting" && exit 0
else
	echo "How much memory to add (in GB)?"
	read MEMORY
	allocation="${MEMORY}G"
	sudo fallocate -l $allocation /swapfile && echo "allocation done"
	sudo chmod 600 /swapfile
	sudo mkswap /swapfile
	sudo swapon /swapfile
	fstab=/etc/fstab
	if grep -q "swapfile" $fstab; then
		echo "Swapfile is already there in  fstab"
	else
		echo  "/swapfile swap swap defaults 0 0"  |   sudo tee -a $fstab
	fi
fi
