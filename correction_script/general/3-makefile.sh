#########################################
########## HAFRECTOR BY CONOEL ##########
#########################################

DIR=$1

echo "\n===================| \033[1mSTEP 3: MAKEFILE \033[0m|=================== "

#INPUTS
make -C $DIR fclean > /dev/null
make -C $DIR > /dev/null
RELINK=`make -C $DIR`
CMP=`cat ressources/mkfl_relink.txt`

#VERIFICATION
if [ "$RELINK" != "$CMP" ]
then
	echo "\n                    \033[31m/!\\ Make relink /!\\ \033[0m"
	echo "\033[33m\c"
	echo $RELINK
	echo "\033[0m\c"
else
	echo "\n\033[32mWell Done ! Your makefile do not relink :D\033[0m"
fi