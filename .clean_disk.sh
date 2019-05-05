cd ~
rm -rf .Trash
du -h | grep 'M\t' | grep cache | cut -d 'M' -f 2 > files
FILES=`cat files`
rm files
for FILE in $FILES
do
	rm -rf $FILE
done
