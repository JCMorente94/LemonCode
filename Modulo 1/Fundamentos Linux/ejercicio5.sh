#! /bin/bash

url=$1
word=$2

if [ "$#" != 2 ]; then
	echo "Se necesitan unicamente dos parametros para ejecutar este script"
else
	curl -s $url > file.txt
	count=$(grep -ac $word file.txt)
	line=$(grep -anm1 $word file.txt | cut -d ":" -f 1)

	if [ $count == 0 ]; then
		echo "No se ha encontrado la palabra \"$word\""
    elif [ $count == 1 ]; then 
        echo "La palabra \"$word\" aparece $count vez"
        echo "Aparece unicamente en la linea $line"
	else
		echo "La palabra \"$word\" aparece $count veces"
		echo "Aparece por primera vez en la linea $line"
	fi
fi