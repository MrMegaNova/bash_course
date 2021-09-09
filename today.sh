#!/bin/bash
file=/root/user.txt
date_full=$(date +%A\ %d\ %B\ %Y)
time=$(date +%Hh%M)
weather_temp=$(curl --silent "https://wttr.in/?0pQ&lang=fr" | grep "°C" | awk '{print $(NF-1)}' | cut -d "(" -f 1)


if [ -f "$file" ]
then
	echo "$file exists."
	name=$(cat $file)
	read -p "Ton nom est $name ? (y/n) : " name_ok
	if [ $name_ok == "y" ]
	then
		echo "Bonjour $name, nous sommes le $date_full , il est $time et il fait actuellement $weather_temp °C"
	else
		read -p "Quel est ton nom ? : " name
		echo "Bonjour $name, nous sommes le $date_full , il est $time et il fait actuellement $weather_temp °C"
		echo $name > /root/user.txt
	fi
else
	echo "$file doesn't exist"
	read -p "Quel est ton nom ? : " name
	echo $name > /root/user.txt
	echo "Bonjour $name, nous sommes le $date_full , il est $time et il fait actuellement $weather_temp °C"
fi
