#!/bin/bash

readarray -t consumos < consumos.txt

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

echo "Ciudad con consumo mínimo: $min_ciudad, mes y año: $min_fecha, consumo: $min_consumo"
echo "Ciudad con consumo máximo: $max_ciudad, mes y año: $max_fecha, consumo: $max_consumo"