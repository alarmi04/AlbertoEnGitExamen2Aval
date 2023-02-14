#!/bin/bash

readarray -t consumos < <(tail -n +2 consumos.txt)

min_consumo=999999
max_consumo=0

min_ciudad=""
max_ciudad=""
min_fecha=""
max_fecha=""

for ((i=0; i<${#consumos[@]}; i++)); do
    ciudad=$(echo ${consumos[$i]} | awk '{print $1}')
    mes=$(echo ${consumos[$i]} | awk '{print $2}')
    anio=$(echo ${consumos[$i]} | awk '{print $3}')
    consumo=$(echo ${consumos[$i]} | awk '{print $4}')

    if (( $consumo > $max_consumo )); then
        max_consumo=$consumo
        max_ciudad=$ciudad
        max_fecha="$mes $anio"
    fi

    if (( $consumo < $min_consumo )); then
        min_consumo=$consumo
        min_ciudad=$ciudad
        min_fecha="$mes $anio"
    fi
done

echo "El consumo mínimo es: $min_ciudad,$min_fecha, $min_consumo"
echo "El consumo máximo es: $max_ciudad, $max_fecha, $max_consumo"