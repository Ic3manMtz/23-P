#!/bin/bash

echo 'Compiling the program'
gcc arbol.c -o arbol

echo 'Ingresa la profundidad de árbol'
read profundidad

echo 'Running the program'
./arbol $profundidad &

#root_pid=$(ps -eo pid,comm | grep arbol | head -n 1 | awk '{print $1}')

#echo -e '\nFirst list of processes'
#pstree -p $root_pid
