touch ~/.cloneP_username.txt
USER=`cat ~/.cloneP_username.txt`

if [ -z $1 ] || [ $1 == '-help' ]
then
	echo "Usage : cloneP -u -help [Project_name] [File_name]"
	exit
fi

if [ "$1" == "-u" ]
then
	if [ -z $2 ]
	then
		echo "Usage : cloneP Project_name [File_name]"
		echo "        cloneP -u Username"
		echo "        cloneP -help"
		exit
	fi
	touch ~/.cloneP_username.txt
	echo "$2" > ~/.cloneP_username.txt
	exit
fi

if [ -z $USER ]
then
	echo "User not defined"
	echo "Please run \`cloneP -u Username\`"
	exit
fi

if [ -e $1 ] && [ -z $2 ]
then
	echo "The file already exist"
	exit
fi

echo "Downloading the $1 Repository..."
git clone --progress https://github.com/$USER/$1.git $2 2> ./.result
RES=`cat ./.result | grep 'done' | wc -l`
rm ./.result

if [ $RES == 5 ]
then
	echo "\033[32mSuccess\033[0m"
else
	echo "\033[31mFailure\033[0m"
fi
