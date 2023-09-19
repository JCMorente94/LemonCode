#! /bin/bash

url=https://en.wikipedia.org/wiki/Batman

word=$1

if [ "$word" == "" ]; then
	echo "Text not provided"
else
	text=$(curl -s $url)
	count=$(grep -c $word <<< "$text")
	line=$(grep -n -m 1 $word <<< "$text" | cut -d ":" -f 1)

	if [ $count == 0 ]; then
		echo "No se ha encontrado la palabra \"$word\""
	else
		echo "La palabra \"$word\" aparece $count veces"
		echo "Aparece por primera vez en la linea $line"
	fi
fi
