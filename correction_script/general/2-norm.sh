#########################################
########## HAFRECTOR BY CONOEL ##########
#########################################

DIR=$1

echo "\n=====================| \033[1mSTEP 2: NORM \033[0m|===================== "

#INPUTS
touch trace/norme
norminette $DIR | grep Error | cut -d':' -f2 > trace/norme
NB_ERROR=`cat trace/norme | wc -l | cut -d" " -f8`

#VERIFICATION
if [ "$NB_ERROR" != "0" ]
then
	echo "\n                    \033[31m/!\\ Norm error /!\\ \033[0m"
	echo "\033[33m\c"
	cat trace/norme
	echo "\033[0m\c"
else
	echo "\n\033[32mWell Done ! Your project is normed :D\033[0m"
fi