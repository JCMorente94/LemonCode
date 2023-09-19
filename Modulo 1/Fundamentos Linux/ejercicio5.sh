#! /bin/bash

url=$1
word=$2

if [ "$3" != "" ]; then
	echo "Se necesitan unicamente dos parametros para ejecutar este script"
else
	text=$(curl -s $url)
	count=$(grep -c $word <<< "$text")
	line=$(grep -n -m 1 $word <<< "$text" | cut -d ":" -f 1)

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