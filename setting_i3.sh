#! /bin/bash
all_apps=(i3-wm i3blocks i3status i3-gaps deepin-session-ui )

echo "Please avoid running this script as root"
echo "i3 apps"
echo "${all_apps[@]}"

printf "Would you like to install all the i3 apps? y/n \n"
read var_all

if [ "$var_all" = "Y" ] || [ "$var_all" = "y" ]
then
	for key in "${all_apps[@]}"; 
	do 
		sudo pacman --needed -S "$key"
	done;

else
	printf "Personalized installation \n"
	for key in "${all_apps[@]}" 
	do
		printf "Would you like to install $key? y/n \n"
		read var
		if  [ "$var" = "Y" ] || [ "$var" = "y" ]
		then
		    sudo pacman --needed -S "$key"
		else
		    printf "Ignoring $key installation \n"
		fi
	done
fi

