# TO DO LIST
# [NORM] Verifier les headers !
# [MAKEFILE] Rajouter une verification vis a vis des fichiers deja compiles (*.o *.a executables etc)


PROJECT="push_swap"
FILES="trace"
TESTS="$FILES/tests"

############ PRELUDE ############
mkdir -p $FILES
rm -rf $FILES/*
clear
echo "=================\033[1m CONOEL's $PROJECT correction script\033[0m ================="
echo "Good \033[32mluck\033[0m, and have \033[31mfun\033[0m !"
echo
read -p "Press a key to begin, if you are brave enought !" -n 1 -s
clear
read -p "Project path : " DIR
if [ ! -e $DIR ] || [ ! -d $DIR ] || [ $DIR == "" ]
then
	echo "\033[31mYour path does not exist or isn't a directory \033[0m[$DIR]"
	exit
fi
clear
read -p "Source directory relative path : " SRC
if [ ! -e $DIR/$SRC ] || [ ! -d $DIR/$SRC ] || [ $DIR == "" ]
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
echo "====================| \033[1mSTEP 1: AUTHOR \033[0m|==================== "

#INPUTS
LOGIN_FILE=`cat $DIR/auteur`

#VERIFICATION
if [ "$LOGIN_FILE" != "$LOGIN" ]
then
	echo "                    \033[31m/!\\ Wrong Login /!\\ \033[0m"
else
	echo "\n\033[32mWell Done ! You know how to type your login :D\033[0m"
fi

############### STEP2 ############ 
echo "\n=====================| \033[1mSTEP 2: NORM \033[0m|===================== "

#INPUTS
norminette $DIR/$SRC | grep Error | cut -d':' -f2 > "$FILES/norme"
NB_ERROR=`cat $FILES/norme | wc -l | cut -d" " -f8`

#VERIFICATION
if [ "$NB_ERROR" != "0" ]
then
	echo "                    \033[31m/!\\ Norm error /!\\ \033[0m"
	echo "\033[33m\c"
	cat norme
	echo "\033[0m\c"
else
	echo "\n\033[32mWell Done ! Your project is normed :D\033[0m"
fi

############## STEP3 ############ 
echo "\n===================| \033[1mSTEP 3: MAKEFILE \033[0m|=================== "

#INPUTS
make -C $DIR -s > "$FILES/makefile"
RELINK=`make -C $DIR -s`

#VERIFICATION
if [ "$RELINK" != "" ]
then
	echo "                    \033[31m/!\\ Make relink /!\\ \033[0m"
	echo "\033[33m\c"
	cat norme
	echo "\033[0m\c"
else
	echo "\n\033[32mWell Done ! Your makefile do not relink :D\033[0m"
fi



echo "\n===============| \033[1mSTEP 3: BAD BAD INPUTS... \033[0m|============== "

#INPUTS
mv $DIR/$PROJECT .
mkdir -p "$FILE/$TESTS"
mkdir -p "$FILE/$TESTS/verif"
mkdir -p "$FILE/$TESTS/you"
./$PROJECT > "$FILES/$TESTS/you/01"
echo "No arguments" > "$FILES/test/verif/01msg"
./$PROJECT "" > "$FILES/$TESTS/you/02"
echo "Empty string" > "$FILES/test/verif/02msg"
./$PROJECT "5 454c" > "$FILES/$TESTS/you/03"
echo "Alphanumerical character [one string]" > "$FILES/test/verif/03msg"
./$PROJECT 5 454c > "$FILES/$TESTS/you/04"
echo "Alphanumerical caracter [separated args]" > "$FILES/test/verif/04msg"
./$PROJECT "-5 25 3 -5" > "$FILES/$TESTS/you/05"
echo "Number repeated [one string]" > "$FILES/test/verif/05msg"
./$PROJECT -5 25 3 -5 > "$FILES/$TESTS/you/06"
echo "Number repeated [separated args]" > "$FILES/test/verif/06msg"
./$PROJECT "2 2147483647 2" > "$FILES/$TESTS/you/07"
echo "INT MAX (not supposed to return error) [one string]" > "$FILES/test/verif/07msg"
./$PROJECT 2 147484647 2 > "$FILES/$TESTS/you/08"
echo "INT MAX (not supposed to return error) [separated args]"  > "$FILES/test/verif/08msg"
./$PROJECT "2 147483648 2" > "$FILES/$TESTS/you/09"
echo "INT MAX + 1 [one string]" > "$FILES/test/verif/09msg"
./$PROJECT 2 147483648 2 > "$FILES/$TESTS/you/10"
echo "INT MAX + 1 [separated args]" > "$FILES/test/verif/10msg"

#VERIFICATION
LS=`ls "$FILES/$TESTS/you"`
FAILED_TESTS=0
for NAME in $LS
do
	if [ "$NAME" != "Error" ]
	then
		echo "\033[33m\c" > $FILES/parse_return
		cat $FILES/$TESTS/verif/"$NAME"msg > $FILES/parse_return
		echo "\033[0m\c" > $FILES/parse_return
		$FAILED_TESTS+=1
	fi
done
if [ $FAILED_TESTS -eq 0 ]
then
	echo "\n\033[32mWell Done ! Your parsing seem great :D\033[0m"
else
	echo "                    \033[31m/!\\ Parse error /!\\ \033[0m"
	cat $FILES/parse_return
fi
