#! /bin/bash
echo "Please avoid running this script as root"

echo "Would you like to install and configure all the Network package? y/n" \
read var_all

if [ "$var_all" = "n" ] || [ "$var_all" = "N" ]
then
	echo "Would you like to install Network Manager? y/n" \
	read var
fi
if  [ "$var" = "Y" ] || [ "$var" = "y" ] || [ "$var_all" = "Y" ] || [ "$var_all" = "y" ]
then
    yay --needed -S networkmanager
else
    echo "Ignoring NetworkManager installation"
fi

if [ "$var_all" = "n" ] || [ "$var_all" = "N" ]
then
	echo "Would you like to enable NetworkManager service? y/n" \
	read var
fi
if  [ "$var" = "Y" ] || [ "$var" = "y" ] || [ "$var_all" = "Y" ] || [ "$var_all" = "y" ]
then
    systemctl enable NetworkManager
    systemctl start NetworkManager
else
    echo "Ignoring NetworkManager enabling"
fi