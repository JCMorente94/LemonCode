#! /bin/bash

url=https://en.wikipedia.org/wiki/Batman

word=$1

if [ "$word" == "" ]; then
    echo "Text not provided"
else
    curl -s $url -o file.txt
    count=$(grep -ac $word file.txt)
    line=$(grep -anm1 $word file.txt | cut -d ":" -f 1)

    if [ $count == 0 ]; then
        echo "No se ha encontrado la palabra \"$word\""
    else
        echo "La palabra \"$word\" aparece $count veces"
        echo "Aparece por primera vez en la linea $line"
    fi
fi
