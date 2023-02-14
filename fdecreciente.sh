#!/bin/bash

if [ ! -f consumos.txt ]; then
    echo "El archivo consumos.txt no existe"
    exit 1
fi

ciudades=($(awk 'NR>1 {print $1}' consumos.txt | uniq))

for ciudad in "${ciudades[@]}"; do
    consumos=($(awk -v ciudad="$ciudad" '$1 == ciudad && $3 == 2022 {print $4}' consumos.txt))

    is_decreasing=true
    for ((i=1; i<${#consumos[@]}; i++)); do
        if (( ${consumos[$i]} >= ${consumos[$i-1]} )); then
            is_decreasing=false
            break
        fi
    done
    if $is_decreasing; then
        echo "La ciudad $ciudad ha tenido un consumo decreciente."
    fi
done