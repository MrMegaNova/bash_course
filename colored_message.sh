#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`

read -p "Choisissez entre rouge, vert et bleu (rouge/vert/bleu): " color
read -p "Quel est votre message: " message

while [ "$color" != "vert" ] && [ "$color" != "rouge" ] && [ "$color" != "bleu" ]
do
	echo "Vous devez choisir entre vert et rouge!"
	read -p "Choisissez entre rouge et vert (rouge/vert): " color
done

if [ $color = "vert" ]
then
	echo $green $message $reset
elif [ $color == "rouge" ]
then
	
	echo $red $message $reset
elif [ $color == "bleu" ]
then
	echo $blue $message $reset
fi
