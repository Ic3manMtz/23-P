#!/bin/bash

echo 'Compilando programa...'
gcc arbol.c -o arbol

echo -e '\nIngresa la profundidad de árbol'
read profundidad

echo -e '\nEjecutando programa arbol'
./arbol $profundidad 