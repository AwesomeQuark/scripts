#########################################
########## HAFRECTOR BY CONOEL ##########
#########################################

DIR=$1
LOGIN=$2

echo "====================| \033[1mSTEP 1: AUTHOR \033[0m|==================== "

#INPUTS
LOGIN_FILE=`cat -e $DIR/auteur`

#VERIFICATION
if [ "$LOGIN_FILE" != "$LOGIN\$" ]
then
	echo "\n                    \033[31m/!\\ Wrong Login /!\\ \033[0m"
	echo "\033[33m\c"
	echo "$LOGIN_FILE"
	echo "\033[0m\c"
else
	echo "\n\033[32mWell Done ! You know how to type your login :D\033[0m"
fi