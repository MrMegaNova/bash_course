#!/bin/bash


check_apache=$(dpkg -s apache2 | grep "Status")

echo "Mise à jour des dépots en cours..."
apt-get update > /dev/null 2>&1
echo "Dépots à jour!"

echo "Mise à jour du système en cours..."
apt-get full-upgrade -y > /dev/null 2>&1
echo "Mise à jour du système terminé"

echo $check_apache

if [[ $check_apache != *"installed"* ]]
then
	echo "Installation d'apache en cours..."
	apt-get install apache2 -y > /dev/null 2>&1
	echo "Installation d'apache terminé!"
else
	echo "Apache2 est déjà installé sur la machine!"
fi

read -p "Combien de sites souhaitez-vous créer ? : " sites

number=0

while [[ $sites != 0 ]]
do
	number=$(($number+1))
	read -p "Quel est le nom site numéro $number: " site_name
	echo "Je créer le site $site_name"
	grep -v "#" /etc/apache2/sites-available/000-default.conf > /etc/apache2/sites-available/$site_name.conf.tmp
	awk 'NR==2{print "        ServerName '$site_name'"}1' /etc/apache2/sites-available/$site_name.conf.tmp > /etc/apache2/sites-available/$site_name.conf
	rm /etc/apache2/sites-available/$site_name.conf.tmp
	sed -i "s/html/$site_name/g" /etc/apache2/sites-available/$site_name.conf
	a2ensite $site_name.conf > /dev/null 2>&1
	mkdir /var/www/$site_name
	echo "<h1>Bienvenue sur $site_name</h1>" > /var/www/$site_name/index.html
	let "sites--"
done

echo "Reload de apache"
service apache2 reload

echo "Bienvenue sur un site configuré automatiquement via un script" > /var/www/html/index.html
echo "Configuration terminé!"
