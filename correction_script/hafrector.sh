#########################################
########## HAFRECTOR BY CONOEL ##########
#########################################

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
read -p "Wich pRoJeCt do you want me to evaluate : " PROJECT
if [ "$PROJECT" == "" ]
then
	echo "\033[31mYou have to type something dumbass...\033[0m"
	exit
fi
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
sh general/1-author.sh $DIR $LOGIN

############## STEP2 ############
#              NORM             #
sh general/2-norm.sh $DIR

############## STEP3 ############
#             MAKEFILE          #
sh general/3-makefile.sh $DIR

############## STEP4 ############
#              CHEAT            #
sh general/4-cheat.sh $DIR $LOGIN

#################################
############ SPECIFIC ###########
#################################