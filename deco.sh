#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Debe proporcionar el nombre de la ciudad como parámetro"
    exit 1
fi

media=$(./cmedia.sh $1 | awk '{print $NF}')

if [ $media -lt 400 ]; then
    echo "La ciudad de $1 tiene una calificación ECO"
else
    echo "La ciudad de $1 tiene una calificación NO ECO"
fi
