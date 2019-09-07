#! /bin/bash
all_apps=(spotify ora)

echo "Please avoid running this script as root"
echo "User useful apps"
echo "${all_apps[@]}"

printf "Would you like to install all the User useful apps? y/n \n"
read var_all

if [ "$var_all" = "Y" ] || [ "$var_all" = "y" ]
then
	for key in "${all_apps[@]}"; 
	do 
		yay --needed -S "$key"
	done;

else
	printf "Personalized installation \n"
	for key in "${all_apps[@]}" 
	do
		printf "Would you like to install $key? y/n \n"
		read var
		if  [ "$var" = "Y" ] || [ "$var" = "y" ]
		then
		    yay --needed -S "$key"
		else
		    printf "Ignoring $key installation \n"
		fi
	done
fi