#!/bin/bash

read -p "Introduce una ciudad:" ciudad

while ! grep -qw "$ciudad" consumos.txt; do
  read -p "Ciudad no encontrada. Introduce una ciudad válida:" ciudad
done

total=0
while read line; do
  if [[ $line == "$ciudad"* ]]; then
    consumo=$(echo $line | awk '{print $4}')
    total=$((total+consumo))
  fi
done < consumos.txt

echo "El consumo total de $ciudad es $total."
