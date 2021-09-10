#!/bin/bash
echo "Mon script démarre"
read -p "nombre:" nombre 

echo "$nombre"

nombre1=10


if [ "$nombre" -lt $nombre1 ]
then
	echo "$nombre est plus petit que $nombre1"
elif [ "$nombre" = $nombre1 ]
then
	echo "$nombre est égal à $nombre1"
else
	echo "$nombre est plus grand que $nombre1"
fi
echo "Mon script se termine"
