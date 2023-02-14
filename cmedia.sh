#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Debe proporcionar el nombre de la ciudad como parámetro"
    exit 1
fi

ciudad=$1
awk -v ciudad="$ciudad" '$1 == ciudad {sum+=$4; count++} END {if (count > 0) print "Media de consumo de " ciudad ":", sum/count; else print "No hay consumos para la ciudad " ciudad}' consumos.txt
