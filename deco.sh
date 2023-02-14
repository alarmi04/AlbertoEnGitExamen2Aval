#!/bin/bash

# Se comprueba si se ha pasado el argumento con el nombre de la ciudad
if [ -z "$1" ]; then
    echo "Error: Debe proporcionar el nombre de la ciudad como parámetro"
    exit 1
fi

# Se obtiene la media de consumo de la ciudad especificada
media=$(./cmedia.sh $1 | awk '{print $NF}')

# Se comprueba la calificación eco de la ciudad
if [ $media -lt 400 ]; then
    echo "La ciudad de $1 tiene una calificación ECO"
else
    echo "La ciudad de $1 tiene una calificación NO ECO"
fi
