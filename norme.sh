if [ -z $1 ]
then
	echo "Usage: norme [file]"
	exit
fi

echo "#########################################"
echo "#########################################"
echo "##  _  _    ___    ____   __  __   ___ ##"
echo "## | \| |  / _ \  | __ \ |  \/  | |  / ##"
echo "## |    | | |_| | |    / | |\/| | | |- ##"
echo "## |_|\_|  \___/  |_|\_\ |_|  |_| |__\ ##"
echo "##                                     ##"
echo "#########################################"
echo "#########################################"

norminette $1 | grep -v "Warning" | cut -d' ' -f 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 > norme.out

while read LINE
do	
	FILE=`echo $LINE | grep ./`
	if [ "$FILE" != "" ]
	then
		echo "\033[31m\c"
		echo $LINE
		echo "\033[0m\c"
	else
		echo $LINE
	fi
done < norme.out
rm norme.out

