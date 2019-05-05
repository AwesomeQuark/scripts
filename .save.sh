PATH="~/Documents/gits"
for REPERTORY in "$PATH/*"
do
	cd $PATH/$REPERTORY
	STATUS=`git status | grep "Untracked" | wc -l | cut -d' ' -f8`
	if [ $STATUS -eq 1 ]
	then
		git add *
		git commit -m "autosave"
		git push
	fi
done
