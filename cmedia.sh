#!/bin/bash

# Se comprueba si se ha pasado el argumento con el nombre de la ciudad
if [ -z "$1" ]; then
    echo "Error: Debe proporcionar el nombre de la ciudad como parámetro"
    exit 1
fi

# Se obtiene la media de consumo de la ciudad especificada
media=$(awk -v ciudad="$1" '$1 == ciudad { sum += $4; count++ } END { print int(sum/count) }' consumos.txt)

# Se muestra la media de consumo en la pantalla
echo $media
