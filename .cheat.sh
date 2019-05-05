git clone $2 $3
if [ -z $3 ]
then
	NAME="conoel6"
else
	NAME=$3
fi

#rm ./$NAME/src/ft_strcat_buff.c
rm ./$NAME/haflib/src/print_char_str.c 21> /dev/null
cp ~/Documents/gits/push_swap/haflib/src/print_char_str.c ./$NAME/haflib/src/print_char_str.c 21> /dev/null

