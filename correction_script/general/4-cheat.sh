#########################################
########## HAFRECTOR BY CONOEL ##########
#########################################

DIR=$1
LOGIN=$2

echo "\n====================| \033[1mSTEP 4: CHEAT  \033[0m|==================== "

#INPUTS
NAMES=`find $DIR -type f -exec cat {} + | grep By: | grep -v $LOGIN`

#VERIFICATION
if [ "$NAMES" != "" ]
then
	echo "\n                 \033[31m/!\\ Incorrect headers /!\\ \033[0m"
	echo "\033[33m\c"
	echo $NAMES
	echo "\033[0m\c"
else
	echo "\n\033[32mWell Done ! Your files belong to you :D\033[0m\n"
fi