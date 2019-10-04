#!/bin/sh

if [ "$#" != 0 ]
then
	echo "Usage: $0"
	echo "	There are two modes : Create | restore"
	echo "		Create:"
	echo "Img are compressed with gzip"
	echo "They are stored in /backup/PARTITION.img.gz"
	echo "		Restore:"
	echo "Filesystem is automatically unmounted and remounted during the restauration"
	exit
fi


#######################
##### INPUT UTILS #####
#######################

get_partition() {
	read input
	while [ -z "$input" ] || [ ! -b "/dev/$input" ]
	do
		echo "\033[31mWrong partition name\033[0m" 1>&2
		read input
	done
	echo $input
} # fonction pour lire le nom de la partition

get_mode() {
	read input
	while [ -z "$input" ] || [ "$input" != "c" -a "$input" != "r" ]
	do
		echo "\033[31mUnrecognised mode\033[0m" 1>&2
		read input
	done
	echo $input
} # fonction pour lire le mode

########################
##### DATA COLLECT #####
########################

if [ $(id -u) != "0" ] # verification root
then
	echo "You need to use this script as root"
	echo "Try sudo $0"
	exit
fi

clear
lsblk # affichage des partitions dispo

echo
echo "\033[32mChoose the target partition :\033[0m"
partition=$(get_partition)

clear
echo "\033[32mDo you want to :"
echo "	Create an image  [c]"
echo "	Recover an image [r]\033[0m"
mode=$(get_mode)

if [ "$mode" = "c" ]
then

#########################
##### MODE CREATION #####
#########################
	
	mkdir -p /backup
	echo "STATUS : Image file creation [/backup/$partition.img.gz]"
	dd if=/dev/$partition status=progress | gzip -c > /backup/$partition.img.gz
	if [ $? != "0" ] # verification de code d'erreur de dd ( 0 = reussite ; autre = echec )
	then
		echo "\033[31m###< FAILURE >###\033[0m"
	else
		echo "\033[33m###< SUCCESS >###\033[0m"
	fi
else

########################
##### MODE RECOVER #####
########################
	
	if [ ! -f "/backup/$partition.img.gz" ] # s'il n'y a pas eu d'image crée
	then
		echo "ERROR : There is no backup for this partition..."
		echo "\033[31m###< FAILURE >###\033[0m"
		exit
	fi
	mount=$(lsblk /dev/$partition | tail -n 1 | tr -s ' ' | cut -d' ' -f7) # recuperation du point de montage
	if [ ! -z "$mount" ]
	then
		echo "STATUS : unmounting partition"
		umount $mount
		echo "STATUS : restoring data"
		gunzip -c /backup/$partition.img.gz | dd of=/dev/$partition status=progress
		echo "STATUS : remounting partition"
		mount /dev/$partition $mount
	else
		echo "STATUS : restoring data"
		gunzip -c /backup/$partition.img.gz | dd of=/dev/$partition status=progress
	fi
	echo "\033[33m###< DONE >###\033[0m"
fi
