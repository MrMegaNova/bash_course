#!/bin/bash
file=/root/user.txt
date_full=$(date +%A\ %d\ %B\ %Y)
time=$(date +%Hh%M)
weather_temp=$(curl --silent "https://wttr.in/?0pQ&lang=fr" | grep "°C" | awk '{print $(NF-1)}' | cut -d "(" -f 1)
weather_tommorow=$(curl --silent "https://wttr.in/?2Qn&lang=fr" | tail -n 12 | head -n 10)

f_bonjour (){
	echo "Bonjour $name, nous sommes le $date_full , il est $time et il fait actuellement $weather_temp °C"
}

f_username (){
	read -p "Quel est ton nom ? : " name
	echo $name > /root/user.txt
}

if [ -f "$file" ]
then
	name=$(cat $file)
	read -p "Ton nom est $name ? (y/n) : " name_ok
	if [ $name_ok == "y" ]
	then
		f_bonjour
	else
		f_username
		f_bonjour
	fi
else
	f_username
	f_bonjour
fi
read -p "Voulez-vous connaitre la météo de demain? (y/n): " tommorow_weather

if [ $tommorow_weather == "y" ]
then
	echo "$weather_tommorow"
fi
