#!/bin/bash

echo 'Compilando el programa'
gcc ArbolBinario.c -o ArbolBinario

echo 'Ejecutando el programa'
./ArbolBinario &

pid=$(ps -eo pid,comm | grep ArbolBinario | head -n 1 | awk '{print $1}')

echo -e "Pid de la Raiz: $pid\n"

pstree -cp $pid