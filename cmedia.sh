#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Debe proporcionar el nombre de la ciudad como parámetro"
    exit 1
fi

media=$(awk -v ciudad="$1" '$1 == ciudad { sum += $4; count++ } END { print int(sum/count) }' consumos.txt)

echo $media
