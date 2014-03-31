#!/bin/bash
PATH=/bin:/usr/bin:/usr/local/bin ; export PATH 
# Variables assignment start
 : ${USER?} ${HOME?} 
sourceList_dir=/etc/apt
# Variables assignment end
echo "This script likely should not be run without first doing a backup of your Linux OS"
echo "However if undetured by the above warning you may use this script to"
echo "Upgrade your distrobution from squeeze to wheezy"
echo "You should be logged in as your root Linux user when running this script"
{ 
# confirm with the user 
read -r -p "Do you wish to continue? [y/N] " response 
case "$response" in 
	[yY][eE][sS]|[yY]) 
# if yes, then start risking changes 
		echo "Displaying curent version of Linux system"
		uname -mrs
		echo "Modifing your sources list and replacing all mentions of : squeeze : with : wheezy : under : $sourceList_dir : directory"
		sed 's/squeeze/wheezy/g' $sourceList_dir
		echo "Issuing an : apt-get update : command"
		apt-get update
		echo "Issuing an : apt-get upgrade : command"
		apt-get upgrade
		echo "Issuing an : apt-get dist-upgrade : command"
		apt-get dist-upgrade
		echo "You should now reboot your Linux OS with the following command in a normal Android terminal if running with Debian Kit app"
		echo "	deb u; deb u && deb k && echo \"Shutdown done...Restarting now...\" && deb"
		echo "Then check that the update took without errors with the following commands inputed on your Linux terminal"
		echo "varify with : lsb_release -a"
		echo "check kernal with : check kernal"
		echo "check logfile for errors with either :"
		echo "tail -f /var/log/messages"
		echo "and or"
		echo "egrep -i --color 'err|warn|crit' /var/log/fileName"
		echo "exiting now in preperation for reboot"
		exit
		;; 
	*) 
#		 Otherwise exit.. 
	echo "Good Night" 
	exit 
	;; 
esac
} 
echo "end of script, exiting now..."
exit
# credits
# http://www.cyberciti.biz/faq/howto-debian-linux-upgrade-6-squeeze-to-7-wheezy/
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-replace-text-inside-a-file-using-substitute-command/