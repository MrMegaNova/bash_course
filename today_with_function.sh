#!/bin/bash
file=/root/user.txt
date_full=$(date +%A\ %d\ %B\ %Y)
time=$(date +%Hh%M)
weather_temp=$(curl --silent "https://wttr.in/?0pQ&lang=fr" | grep "°C" | awk '{print $(NF-1)}' | cut -d "(" -f 1)

f_bonjour (){
	echo "Bonjour $name, nous sommes le $date_full , il est $time et il fait actuellement $weather_temp °C"
}


if [ -f "$file" ]
then
	name=$(cat $file)
	read -p "Ton nom est $name ? (y/n) : " name_ok
	if [ $name_ok == "y" ]
	then
		f_bonjour
	else
		read -p "Quel est ton nom ? : " name
		f_bonjour
		echo $name > /root/user.txt
	fi
else
	read -p "Quel est ton nom ? : " name
	echo $name > /root/user.txt
	f_bonjour
fi
