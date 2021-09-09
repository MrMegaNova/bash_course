#!/bin/bash
#valeur1=$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)
valeur1=${RANDOM:0:2}

read -p "Devinez le nombre entre 0 et 99:" number

while [ $number != $valeur1 ]
do
	if [ $number -lt $valeur1 ];
	then
		echo "Le nombre est plus grand! Essayez encore."
	else
		echo "Le nombre est plus petit! Essayez encore."
	fi
	read -p "Devinez le nombre entre 0 et 99:" number
done

if [ $number == $valeur1 ]
then
	echo "Félicitation, vous avez trouvez le nombre magique ($valeur1)"
else
	echo "Il y a un bug"
fi

