#!/bin/bash

echo 'Compilando el programa'
gcc ArbolNario.c -o ArbolNario

echo 'Ejecutando el programa'
./ArbolNario 2 &

pid=$(ps -eo pid,comm | grep ArbolNario | head -n 1 | awk '{print $1}')

echo -e "Pid de la Raiz: $pid\n"

pstree -cp $pid