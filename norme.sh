if [ -z $1 ]
then
	echo "Usage: norme [file]"
	exit
fi

echo "#########################################"
echo "##  _  _    ___    ____   __  __   ___ ##"
echo "## | \| |  / _ \  | __ \ |  \/  | | _/ ##"
echo "## |    | | |_| | | \/ / | |\/| | | _| ##"
echo "## |_|\_|  \___/  |_|\_\ |_|  |_| |__\ ##"
echo "##                                     ##"
echo "#########################################"

norminette $1 | grep -v "Warning" | cut -d' ' -f 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 > norme.out
TOT_ERRORS=-1
FILES_READ=0

while read LINE
do	
	FILE=`echo $LINE | grep ./`
	if [ "$FILE" != "" ]
	then
		FILES_READ=`echo "$FILES_READ + 1" | bc`
	fi
	if [ "$FILE" == "" -o "$OLD_FILE" == "" ]
	then
		if [ "$OLD_FILE" != "" ]
		then
			echo "\033[31m\033[1m\033[4m\c"
			echo "FILE: \c"
			echo $OLD
			echo "\033[0m\c"
		else
			echo "\t\c"
			echo $OLD
			TOT_ERRORS=`echo "$TOT_ERRORS + 1" | bc`
		fi
	fi
	OLD=$LINE
	OLD_FILE=$FILE
done < norme.out
echo "\nERRORS: $TOT_ERRORS"
echo "FILES READ: $FILES_READ"
rm norme.out

