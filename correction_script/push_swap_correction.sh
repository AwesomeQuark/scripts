#########################################
########## HAFRECTOR BY CONOEL ##########
#########################################

# TO DO LIST
# [NORM] Verifier les headers !
# [MAKEFILE] Rajouter une verification vis a vis des fichiers deja compiles (*.o *.a executables etc)


PROJECT="push_swap"
TESTS="trace/tests"

############ PRELUDE ############
if [ -e trace ]
then
	rm -rf trace
fi
mkdir trace
clear
echo "=================\033[1m CONOEL's $PROJECT correction script\033[0m ================="
echo "Good \033[32mluck\033[0m, and have \033[31mfun\033[0m !"
echo
read -p "Press a key to begin, if you are brave enought !" -n 1 -s
clear
read -p "Project path : " DIR
if [ ! -e "$DIR" ] || [ ! -d "$DIR" ] || [ "$DIR" == "" ]
then
	echo "\033[31mYour path does not exist or isn't a directory \033[0m[$DIR]"
	exit
fi
clear
read -p "To whom belong this project ? " LOGIN
clear
echo "[*Strange voice in the distance*] \033[1mCan you do it until the 125 $LOGIN ?\033[0m"
sleep 2
clear
echo "We'll see MUAHAHAHAHAH !"
sleep 1
clear

############## STEP1 ############
#              AUTHOR           #
sh general/author.sh $DIR $LOGIN

############## STEP2 ############
#              NORM             #
sh general/norm.sh $DIR

############## STEP3 ############
#             MAKEFILE          #
sh general/makefile.sh $DIR



# echo "\n===============| \033[1mSTEP 3: BAD BAD INPUTS... \033[0m|============== "

# #INPUTS
# mv "$DIR/$PROJECT" .
# mkdir "$FILE/$TESTS"
# chmod 777 "$DIR/$TESTS"
# mkdir "$FILE/$TESTS/verif"
# chmod 777 "$DIR/$TESTS/verif"
# mkdir "$FILE/$TESTS/you"
# chmod 777 "$DIR/$TESTS/you"
# ./$PROJECT > "trace/$TESTS/you/01"
# echo "No arguments" > "trace/test/verif/01msg"
# ./$PROJECT "" > "trace/$TESTS/you/02"
# echo "Empty string" > "trace/test/verif/02msg"
# ./$PROJECT "5 454c" > "trace/$TESTS/you/03"
# echo "Alphanumerical character [one string]" > "trace/test/verif/03msg"
# ./$PROJECT 5 454c > "trace/$TESTS/you/04"
# echo "Alphanumerical caracter [separated args]" > "trace/test/verif/04msg"
# ./$PROJECT "-5 25 3 -5" > "trace/$TESTS/you/05"
# echo "Number repeated [one string]" > "trace/test/verif/05msg"
# ./$PROJECT -5 25 3 -5 > "trace/$TESTS/you/06"
# echo "Number repeated [separated args]" > "trace/test/verif/06msg"
# ./$PROJECT "2 2147483647 2" > "trace/$TESTS/you/07"
# echo "INT MAX (not supposed to return error) [one string]" > "trace/test/verif/07msg"
# ./$PROJECT 2 147484647 2 > "trace/$TESTS/you/08"
# echo "INT MAX (not supposed to return error) [separated args]"  > "trace/test/verif/08msg"
# ./$PROJECT "2 147483648 2" > "trace/$TESTS/you/09"
# echo "INT MAX + 1 [one string]" > "trace/test/verif/09msg"
# ./$PROJECT 2 147483648 2 > "trace/$TESTS/you/10"
# echo "INT MAX + 1 [separated args]" > "trace/test/verif/10msg"

# #VERIFICATION
# LS=`ls "trace/$TESTS/you"`
# FAILED_TESTS=0
# for NAME in $LS
# do
# 	if [ "$NAME" != "Error" ]
# 	then
# 		echo "\033[33m\c" > trace/parse_return
# 		cat trace/$TESTS/verif/"$NAME"msg > trace/parse_return
# 		echo "\033[0m\c" > trace/parse_return
# 		$FAILED_TESTS+=1
# 	fi
# done
# if [ $FAILED_TESTS -eq 0 ]
# then
# 	echo "\n\033[32mWell Done ! Your parsing seem great :D\033[0m"
# else
# 	echo "                    \033[31m/!\\ Parse error /!\\ \033[0m"
# 	cat trace/parse_return
# fi
